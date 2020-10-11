```
  _                  _   _       
 (_)                | | (_)      
  _ _   _ _   _  ___| |  _  ___  
 | | | | | | | |/ _ \ | | |/ _ \ 
 | | |_| | |_| |  __/ |_| | (_) |
 |_|\__, |\__, |\___|_(_)_|\___/ 
     __/ | __/ |                 
    |___/ |___/                  
    
  ▓▓▓▓▓▓▓▓▓▓
 ░▓ about  ▓ personal website made with Hakyll
 ░▓ author ▓ iyyel <i@iyyel.io>
 ░▓ code   ▓ https://github.com/iyyel/iyyel.io
 ░▓ mirror ▓ https://git.iyyel.io/iyyel/iyyel.io
 ░▓▓▓▓▓▓▓▓▓▓
 ░░░░░░░░░░
```

## Table of Contents
 - [Introduction](#Introduction)
 - [Installing](#Installing)
 - [How it works](#How-it-works)
 - [License](#License)


# Introduction
[iyyel.io](https://iyyel.io) is a personal website used as a blog and portfolio. I use it 
to blog about technology when I feel like it and to showcase the projects that I have been 
involved in. If one would like to contact me, there are several options 
listed on the site as well.

When it comes to websites, I am all about simplicity and performance,
which is why I am a big fan of static websites. This site is built using the static generation tool
[Hakyll](https://jaspervdj.be/hakyll/) which makes it easy to manage blogs with simple markdown and html files.
The site scores perfect performance results in almost all tests due to its static nature.


# Installing
First, install [Hakyll](https://jaspervdj.be/hakyll/) by following the link.

Clone this repository (use the mirror if needed):

`git clone https://github.com/iyyel/iyyel.io`

Change into the directory:

`cd iyyel.io`

`stack init`

Run the site locally:

`stack exec site build`

`stack exec site watch`

Visit the site on localhost:8000.


# How it works
In the most basic sense, you run a local server through Hakyll where you can modify your site to your liking.
When you are happy with your result, you can deploy it to your choice of hosting environment.


# License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
