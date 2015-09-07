# Toy Robot Simulator
Simulator to move a robot on a grid area

## Setup
- `git clone git@github.com:VLMH/toy-robot-simulator.git`
- `cd toy-robot-simulator`
- `bundle install`

## How to play
You may start the game in **interactive** mode or **file** mode

#### Start the game
**Interactive Mode**
- `cd path/to/simulator`
- `bin/play -i`

**File (YAML) Mode**
- `cd path/to/simulator`
- `bin/play -f <path/to/yaml/file>`

> Please refer to [sample.yml](sample.yml) for file settings

#### Commands
```
PLACE x, y, direction   place robot on playground
                        'x' and 'y' are integer
                        direction can be one of ['north', 'east', 'south', 'west']
MOVE                    move a step forward
LEFT                    turn left
RIGHT                   turn right
REPORT                  report on current position
QUIT                    quit the game
HELP                    print available commands
```
