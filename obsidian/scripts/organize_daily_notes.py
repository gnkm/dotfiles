"""
指定されたデイリーノートファイルを、そのフロントマターに記載された年、週番号に基づいて、適切な週のフォルダに移動します。

使い方:
  python scripts/organize_daily_notes.py path/to/your/note.md

例:
  python3 scripts/organize_daily_notes.py daily-note/2025-07-12.md
  => daily-note/2025/W28/2025-07-12.md に移動する。

"""

import argparse
import logging
import re
import shutil
from pathlib import Path


class WeekNotFoundError(ValueError):
    """週番号が見つからない場合に発生する例外。"""

    pass


def get_week_number_from_file(file_path: Path) -> int:
    """
    Markdownファイルのフロントマターを解析して週番号を取得します。

    Args:
        file_path: Markdownファイルへのパス。

    Returns:
        週番号。

    Raises:
        WeekNotFoundError: 週番号がファイルに見つからない場合。
        IOError: ファイルの読み込み中にエラーが発生した場合。
    """
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
        # 正規表現を使い、フロントマターから "week: XX" を見つける
        match = re.search(r"^week:\s*(\d+)", content, re.MULTILINE)
        if match:
            return int(match.group(1))
        else:
            raise WeekNotFoundError("'week' が見つかりません")


def get_year_from_filename(file_path: Path) -> str:
    """
    ファイル名から年を抽出します。

    Args:
        file_path: Markdownファイルへのパス。

    Returns:
        年（文字列）。

    Raises:
        ValueError: ファイル名から年を抽出できない場合。
    """
    # ファイル名から年を抽出（例: 2025-07-12.md -> 2025）
    filename = file_path.stem  # 拡張子を除いたファイル名
    year_match = re.match(r"(\d{4})-\d{2}-\d{2}", filename)
    if year_match:
        return year_match.group(1)
    else:
        raise ValueError(f"ファイル名 '{filename}' から年を抽出できません")


def main():
    """
    指定されたデイリーノートファイルを、フロントマター内の 'week' プロパティに基づいて
    適切な週ごとのフォルダに移動します。
    """
    logging.basicConfig(
        level=logging.INFO, format="%(asctime)s [%(levelname)s] %(message)s"
    )

    parser = argparse.ArgumentParser(
        description="デイリーノートファイルを週ごとのフォルダに移動します。"
    )
    parser.add_argument(
        "file_path", type=Path, help="移動するデイリーノートのファイルパス"
    )
    args = parser.parse_args()

    file_path = args.file_path

    logging.info(f"ファイルの整理を開始します: {file_path}")

    if not file_path.is_file():
        logging.error(f"ファイルが見つかりません: '{file_path}'")
        return

    try:
        week_number = get_week_number_from_file(file_path)
        year = get_year_from_filename(file_path)

        # daily-noteディレクトリを基準に移動先を決定
        daily_note_dir = file_path.parent
        year_dir = daily_note_dir / year
        week_folder_name = f"W{week_number}"
        dest_dir = year_dir / week_folder_name

        # 年ディレクトリと週ディレクトリを作成
        dest_dir.mkdir(parents=True, exist_ok=True)

        # ファイルを移動
        new_file_path = dest_dir / file_path.name
        shutil.move(str(file_path), str(new_file_path))
        logging.info(
            f"移動完了: '{file_path.name}' -> '{dest_dir.relative_to(daily_note_dir)}'"
        )

    except (WeekNotFoundError, IOError, ValueError) as e:
        logging.error(f"エラー '{file_path.name}': {e}")
    except shutil.Error as e:
        logging.error(f"移動エラー '{file_path.name}': {e}")


if __name__ == "__main__":
    main()
