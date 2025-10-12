# Compass

This is a game theory-based tool for interpersonal communication. Available in both web and iOS versions (unpublished).

## Overview

Compass is a communication tool that helps partners (of any kind) to:
1. Articulate issues；
2. Visualize emotional responses；
3. Compare perspectives；
4. Identify misunderstandings and disconnects。

## Tabletop Prototype

The initial idea was simple. Jerry and I realized we too often assumed things about each other's feelings about the same events, without actually knowing the other party's real reactions. This led to a lot of misunderstandings.

One day I drew a grid to visualize our emotional responses:

![Prototype 1](./Prototype%201.jpg)

For any given event, each person places a pin somewhere in the grid to show two things:
- **What they think the actor's intention was**: unintentional, intentional, or ill-intentional
- **How they feel about the event (or how the actor assumes the other feels about it)**: bothered, don't mind, or enjoy it

After both people place their pins for the same event, they can compare positions and discuss where misunderstandings or emotional disconnects exist.

For example, when Jerry tells other people about an unfinished writing project of mine, I feel "bothered" (since the writing usually contains unrefined ideas), and I think he's being "unintentional." Meanwhile, Jerry does this "intentionally," assuming I would "enjoy it."

Clearly, our pins would be in very different places.

This tool works best for things we can calmly sit down and discuss together.

However, there are also things that go unnoticed by both parties but have indeed caused emotional reactions. These situations need articulation. One day at an [MIT Sundai Club](https://www.sundai.club/) meeting, I created the web version of Compass to address this.

## Web Version

**[🔗 Launch Compass Web App](https://noah-c.github.io/Compass/compass_matrix.html)** *(right-click to open in new tab)*

The web version offers several features:
- **Simple three-step process**: Articulate the problem first, then place pins, and finally view the combined result.
- **Asynchronous communication**: After one person drops their pin, they can send the "case" to the other party and request their pin placement—enabling communication without needing to be together.
- **Unspoken clarity**: After both pins are placed, both parties can see the results and gain a clearer picture of each other's thoughts about the same event. They can either choose to talk about it further or just leave it there.

At this moment, the core functionality is all there, and I'm now in the process of developing an iOS app based on this web version.

## iOS Version (In Development)

### Design

The iOS app will enhance the experience with mobile-first features:
- **On-the-go articulation**: At any moment, users can articulate an issue they feel uncomfortable about and drop their pin from their phone
- **Automatic notification**: The "case" is automatically sent to the other party, who receives a notification requesting their pin placement
- **Instant shared results**: Once both pins are placed, both parties receive the combined view to understand each other's perspectives

## License

This project is licensed under the MIT License - see the LICENSE file for details.

