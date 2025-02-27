import subprocess
import sys
import time

win_filepath = sys.argv[1]

wsl_filepath = win_filepath.replace('\\', '/')
wsl_filepath = wsl_filepath.replace('"', '')
wsl_filepath = wsl_filepath.replace('C:', '/mnt/c')

print(f"\nFile on Windows: {win_filepath}")
print(f"\nFile from WSL: {wsl_filepath}\n")

EDITOR="nvim"

# TMUX sessions

# if tmux is not open, open wezterm and tmux.
tmux_is_running = subprocess.run(f"wsl.exe -e pgrep tmux").returncode == 0
if not tmux_is_running:
    subprocess.run(["wezterm.exe"])
    subprocess.run(["wsl.exe", "tmux", "new-session", "-ds", "winscp", f"{EDITOR} {wsl_filepath}"])
    sys.exit()

# if there is no session, create the sesssion and open the file
tmux_has_session = subprocess.run(["wsl.exe", "tmux", "has-session", "-t", "winscp", "2>/dev/null"]).returncode == 0
if not tmux_has_session:
    subprocess.run(["wsl.exe", "tmux", "new-session", "-ds", "winscp", f"{EDITOR} {wsl_filepath}"])
    sys.exit()

# if there is a session with name = , create a new window with the file
subprocess.run(["wsl.exe", "tmux", "new-window", "-dt", "winscp", f"{EDITOR} {wsl_filepath}"])
