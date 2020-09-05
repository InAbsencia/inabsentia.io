---
title: Celestial Outbreak
title_lowercase: celestial outbreak
desc_small: A 2D Breakout game
desc_large: is a space-themed, Breakout-like 2D game written in Java.
github_link: https://github.com/iyyel/celestialoutbreak
header_image: celestialoutbreak/header.png
---

Celestial Outbreak is a space-themed, Breakout-like 2D game written in Java.
It features the original Breakout experience in a colorful user interface with
a few extra traits. The game was built with customization in mind, meaning the
user is able to create their own levels by specifying properties such as dimension,
size, speed and color of the blocks, paddle, ball and power ups.

The goal with this project was to create a simple 2D game in Java with minimal usage of 
third-party libraries. The game solely relies on the Graphics2D Java library for drawing 
shapes to the screen. The flow of the game is structured as a finite-state machine such that 
the program always know which state to render and update.
