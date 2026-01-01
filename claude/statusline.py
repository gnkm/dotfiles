#!/usr/bin/env python3
import json
import os
import subprocess
import sys

# ANSIカラーコード
RESET = "\033[0m"
BOLD = "\033[1m"

# 配色（画像に合わせた控えめな色）
BG_GRAY = "\033[48;5;240m"  # パス用（濃いグレー）
BG_GREEN = "\033[48;5;28m"  # gitブランチ用（深緑）
BG_YELLOW = "\033[48;5;214m"  # git変更用（オレンジ）

FG_WHITE = "\033[97m"
FG_BLACK = "\033[30m"
FG_GRAY = "\033[38;5;240m"
FG_GREEN = "\033[38;5;28m"
FG_YELLOW = "\033[38;5;214m"

# Powerline矢印（標準Unicode文字を使用）
ARROW = "\ue0b0"


def shorten_path(path):
    """パスを省略形式に変換 (例: /home/user/projects → ~/u/projects)"""
    home = os.path.expanduser("~")
    if path.startswith(home):
        path = "~" + path[len(home) :]

    parts = path.split("/")
    if len(parts) <= 2:
        return path

    # 最後のディレクトリ以外を1文字に省略
    shortened = []
    for i, part in enumerate(parts[:-1]):
        if part == "~" or part == "":
            shortened.append(part)
        else:
            shortened.append(part[0])
    shortened.append(parts[-1])

    return "/".join(shortened)


def get_git_status():
    """gitステータスを取得（変更ファイル、未追跡ファイルなど）"""
    try:
        # 未追跡ファイルをチェック
        result = subprocess.run(
            ["git", "status", "--porcelain"], capture_output=True, text=True, timeout=1
        )
        if result.returncode == 0 and result.stdout.strip():
            lines = result.stdout.strip().split("\n")
            untracked = sum(1 for line in lines if line.startswith("??"))
            modified = sum(
                1 for line in lines if line[0] in "MADRC" or line[1] in "MADRC"
            )

            status = []
            if untracked > 0:
                status.append("?")
            if modified > 0:
                status.append("±")
            return " " + "".join(status) if status else ""
        return ""
    except:
        return ""


# stdinからJSONを読み込む
data = json.load(sys.stdin)

# 値を抽出
current_dir = data["workspace"]["current_dir"]
shortened_path = shorten_path(current_dir)

# セグメントを構築
segments = []

# パスセグメント
segments.append(f"{BG_GRAY}{FG_WHITE}{BOLD}{shortened_path} {RESET}")

# gitブランチをチェック
if os.path.exists(".git"):
    try:
        with open(".git/HEAD", "r") as f:
            ref = f.read().strip()
            if ref.startswith("ref: refs/heads/"):
                branch = ref.replace("ref: refs/heads/", "")
                git_status = get_git_status()

                # ステータスに応じて色を変更
                if git_status:
                    bg_color = BG_YELLOW
                    fg_color = FG_YELLOW
                else:
                    bg_color = BG_GREEN
                    fg_color = FG_GREEN

                segments.append(f"{FG_GRAY}{bg_color}{ARROW}{RESET}")
                segments.append(
                    f"{bg_color}{FG_WHITE}{BOLD} 🌿 {branch} {git_status} {RESET}"
                )
                segments.append(f"{fg_color}{ARROW}{RESET}")
            else:
                segments.append(f"{FG_GRAY}{ARROW}{RESET}")
    except:
        segments.append(f"{FG_GRAY}{ARROW}{RESET}")
else:
    segments.append(f"{FG_GRAY}{ARROW}{RESET}")

print("".join(segments))
