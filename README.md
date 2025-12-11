
<p align="center">
  <img src="https://img.shields.io/badge/TMUX%20(Terminal%20Multiplexer)-Setup-blueviolet?style=for-the-badge" />
</p>

<h1 align="center">TMUX - A Modern Tmux Configuration</h1>

<p align="center">
A clean, professional tmux setup designed for developers who want <b>speed</b>, <b>clarity</b>, and a <b>beautiful interface</b>.
</p>



```mathematica
████████╗███╗   ███╗██╗   ██╗██╗  ██╗
╚══██╔══╝████╗ ████║██║   ██║╚██╗██╔╝
   ██║   ██╔████╔██║██║   ██║ ╚███╔╝ 
   ██║   ██║╚██╔╝██║██║   ██║ ██╔██╗ 
   ██║   ██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗
   ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝  
```


##  Features

### Modern Status Line - System Metrics
- CPU Usage (%)
- RAM Usage (Used/Total)
- Battery Monitoring
- Clock + Timestamp
- Minimal clean fonts

###  Optimized Navigation
- Ergonomic movements
- Fast pane operations
- Intuitive shortcuts

###  Fastfetch Integration
- Direct shortcut to launch Fastfetch
- Image friendly terminal passthrough
- Prefix + F launches a fastfetch popup

###  Developer‑Focused
- Prefix changed to **CTRL + Space**
- Designed for daily terminal workflows
- Performance tuned
  
## Additional features 

### Animated Welcome Popup

- Displays an animated ASCII boot sequence
- Runs automatically when starting a new session
- Can also be triggered manually with Prefix + a
- Can also be triggered using reload command Prefix + r

### Rectangular Pane Borders
- Panel header showing command + directory

### Professional Status Bar

- Time and date displayed
- Section for CPU, Memory, Network integration

### Modular Script System

- Custom metrics scripts stored under ~/.config/tmux/scripts
- Allows expandable plugin-like architecture
  
### VPN indication
- Custom script under ~/.config/tmux/scripts/vpn.sh
- Shows two different variation green when connected, stay in the same theme otherwise.

## Installation

### 1. Clone Repository

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd ~/.config
git clone https://github.com/ravindran-dev/tmux.git
```

### 2. Source Config

```bash
ln -sf ~/.config/tmux/tmux.conf ~/.tmux.conf
tmux -f ~/.config/tmux/tmux.conf
chmod +x ~/.config/tmux/scripts/*.sh

```
### 3. Install the plugins
```bash
Prefix + I
```

### 4. Reload or Restart TMUX

Inside tmux:
```
Ctrl + Space + r
```
Outside tmux:
```bash
tmux
```



## Folder Structure

```yaml
~/.config/tmux
├── tmux.conf
└── scripts
    ├── cpu.sh
    ├── mem.sh
    └── bat.sh
    └── ascii.sh
    └── tmux.sh
    └── net.sh
    └── vpn.sh
    └── help.sh
```



##  Keymaps

| Operation                   | Key Binding      | Description                           |         
| --------------------------- | ---------------- | ------------------------------------- |
| **Send Prefix**             | `Ctrl + Space`   | Send tmux command prefix              |                  
| **Reload tmux config**      | `Prefix + r`     | Reload `.tmux.conf` & restart UI      |                  
| **Open Fastfetch Window**   | `Prefix + f`     | Opens new window & executes fastfetch |                  
| **Split Pane (Vertical)**   | `Prefix + -`     | Split pane bottom                     |                  
| **Split Pane (Horizontal)** | `Prefix + \`     | Split pane right                                     
| **Move Pane (Left)**        | `Alt + h`        | Jump to pane left                     |                 
| **Move Pane (Down)**        | `Alt + j`        | Jump to pane down                     |                  
| **Move Pane (Up)**          | `Alt + k`        | Jump to pane up                       |                 
| **Move Pane (Right)**       | `Alt + l`        | Jump to pane right                    |                 
| **Resize Pane Left**        | `Prefix + ←`     | Shrink left                           |                
| **Resize Pane Right**       | `Prefix + →`     | Expand right                          |                 
| **Resize Pane Up**          | `Prefix + ↑`     | Expand up                             |                  
| **Resize Pane Down**        | `Prefix + ↓`     | Shrink down                           |
| **New Window**              | `Prefix + c`     | Open a new window                     |                  
| **Rename Window**           | `Prefix + ,`     | Rename current window                 |
| **Rename Session**          | `Prefix + .`     | Rename current Session                |
| **Kill Pane**               | `Prefix + x`     | Close active pane                     |                  
| **Kill Window**             | `Prefix + X`     | Close entire window                   |                  
| **Copy Mode (scroll)**      | Scroll mouse     | Enter scroll/copy mode                |                  
| **Start copy selection**    | `v` in copy mode | Begin selecting text                  |                  
| **Copy selection**          | `y` in copy mode | Copy & exit                           |    
| **Open Welcome popup**      | `Prefix`+ a      | opens Welcome popup                   |




##  System Requirements

| Component | Required |
|----------|----------|
| tmux | >= 3.3 |
| Zsh | Included |
| Fastfetch | Included |
| Kitty | Terminal |



##  Screenshot
### When VPN is not connected
<img width="1920" height="1029" alt="image" src="https://github.com/user-attachments/assets/ab43fb65-5378-4a4d-96be-c7aae38813b7" />

### When VPN is connected
<img width="1920" height="1023" alt="image" src="https://github.com/user-attachments/assets/787e8c67-f481-4ffd-b641-14fe2d7e68d7" />





##  Contributing

Contributions, tweaks, theme variations, and scripts are welcome.
Open a PR or create a feature issue.




##  License

MIT - Use freely for personal & professional work.



##  Author - **Ravindran S**

Developer • AI/ML Enthusiast • Linux Power User  
Crafting professional CLI experiences with simplicity and power.

## 🔗 Connect With Me

You can reach me here:

###  **Socials**
<a href="www.linkedin.com/in/ravindran-s-982702327" target="_blank">
  <img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white">
</a>


<a href="https://github.com/ravindran-dev" target="_blank">
  <img src="https://img.shields.io/badge/GitHub-111111?style=for-the-badge&logo=github&logoColor=white">
</a>


###  **Contact**
<a href="mailto:ravindrans.dev@gmail.com" target="_blank">
  <img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white">
</a>

<a href="mailto:ravindrans.dev@gmail.com" target="_blank">
  <img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white">
</a>

