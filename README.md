# CDE (Custom Desktop Environment)

This project aims to provide a pre-configured set of apps, widgets with a window manager and provide a simple, decent looking desktop UI which is functional right out of box.

#### Target Audience
This is for any person who is like the owner of this project/repo who is 'familiar' with linux, not an expert, not even a mediocre. Just a noob.

## Getting Started
1. Clone this repo on your system at any location of your choice (e.g. ~/Downloads).
	`git clone https://github.com/devv-s/CDE.git`

2. Go into the cloned directory.
	`cd CDE`

3. Run the setup script as privileged rights in your environment.
	`chmod u+x ./Setup.sh`
	`sudo -E ./Setup.sh`


## Roadmap

Most of the OSes out there (like Windows, Mac or other Linux distros) have several common components, namely:

- Task/Status bar
- Calendar
- App Drawer/Menu bar
- Notification Panel
- Workspaces

Including other common features/behaviours. This project aims to cover to components and features as much as possible. Check below for what is on the roadmap, what's in-progress and what has been completed. This checklist will be based on RHEL based distros using Wayland.

The list is of the behaviours/features, categorized by the scope they are related with. Priority # represents the severity of the requirement. Higher the priority #, greater its need is.

### Global Behaviours

- [x] (P5) A decent browser is available.
- [x] (P4) Common, useful environment variables are set.
- [ ] (P5) A (UI) greeter is loaded for login.
- [ ] (P4) Successful login auto starts the Window Manager.
- [ ] (P4) Window manager bootstraps core widgets at startup.
- [ ] (P3) Screen can be locked.
- [ ] (P5) A terminal emulator app must be setup.
- [ ] (P5) A browser app must be setup.

### Task/Status Bar

- [ ] (P4) Has a widget that displays time.
    - [ ] (P4) Is updated at least once per minute.
    - [ ] (P2) Shows all the timezone clocks on hover.
    - [ ] (P1) (Optional) Opens up an app to set clock time. 
- [ ] Has a widget that displays current date
    - [ ] (P2) Opens up an app to set calendar date. 
- [ ] (P5) Has a widget that displays active keyboard layout. 
    - [ ] (P4) Has a toggle keyboard layout shortcut key.
- [ ] (P5) Has a widget that displays internet status. 



