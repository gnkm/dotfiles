"""
指定された、年、週のサマリーファイルを作ります。

使い方:
  python scripts/make_weekly_summary.py year week

例:
  python scripts/make_weekly_summary.py 2025 28
  => `templates/weekly-summary.md` を複製し、このファイル内の `{{ year }}` および `{{ week }}` が対象の年と週に置換された、daily-note/2025/W28/summary.md が生成される。
"""

import sys
from datetime import datetime
from pathlib import Path


def make_weekly_summary(year, week):
    # テンプレートファイルのパス
    template_path = Path("templates/weekly-summary.md")
    # 出力ファイルのパス
    output_path = Path(f"daily-note/{year}/W{week:02}/summary.md")

    # 現在の日時を指定されたフォーマットで取得
    now_datetime = datetime.now().strftime("%Y-%m-%d %H:%M")

    # 出力先のディレクトリを作成
    output_path.parent.mkdir(parents=True, exist_ok=True)

    # テンプレートファイルを複製し、年と週を置換
    with template_path.open("r", encoding="utf-8") as template_file:
        content = template_file.read()
        content = (
            content.replace("{{ year }}", str(year))
            .replace("{{ week }}", f"{week:02}")
            .replace("{{ now }}", now_datetime)
        )

    with output_path.open("w", encoding="utf-8") as output_file:
        output_file.write(content)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("使い方: python scripts/make_weekly_summary.py year week")
        sys.exit(1)
    year = int(sys.argv[1])
    week = int(sys.argv[2])
    make_weekly_summary(year, week)
