# Compass

This is a game theory-based tool for collective decision making. Available in both web and iOS versions.

## Overview

Compass is an interactive tool that helps partners (any kind):
1. Articulate relationship issues
2. Visualize emotional responses
3. Compare perspectives
4. Identify emotional disconnects

The application uses a matrix interface where:
- Vertical axis: Emotional state (Angry to Sad)
- Horizontal axis: Emotional distance (Distant to Close)

## Web Version

### Features
- Simple three-step process
- Responsive design
- Clean, modern interface
- Interactive pin placement
- Visual connection between perspectives

### Usage
1. Open `couple_matrix_three_step.html` in any modern web browser
2. Enter the relationship issue or situation
3. First partner places their pin on the matrix
4. Second partner places their pin
5. View the combined visualization with connecting line
6. Use "Do it again" to start over

### Technical Details
- Built with HTML5, CSS3, and vanilla JavaScript
- No external dependencies required
- Mobile-responsive design
- Uses CSS Grid for matrix layout
- Modern styling with CSS variables

## iOS Version

### Features
- Native SwiftUI implementation
- Smooth animations and transitions
- Gesture-based pin placement
- State persistence between steps
- iOS-native UI components

### Requirements
- iOS 14.0 or later
- Xcode 12.0 or later for development

### Installation
1. Clone the repository
2. Open `CoupleMatrixApp.xcodeproj` in Xcode
3. Build and run on your iOS device or simulator

### Technical Details
- Built with SwiftUI
- MVVM architecture
- Reactive state management
- Custom view components
- Gesture recognition for matrix interaction

## Development

### Project Structure
```
.
├── couple_matrix_three_step.html    # Web version
├── CoupleMatrixApp/                 # iOS app
│   ├── ContentView.swift           # Main view controller
│   ├── StepOneView.swift          # Problem input view
│   ├── StepTwoView.swift          # First partner matrix
│   └── StepThreeView.swift        # Combined matrix view
```

### Contributing
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Inspired by couples therapy techniques
- Built with modern web and iOS technologies
- Designed for simplicity and effectiveness 
