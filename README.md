# GLSL Shader: Hospital Ceiling Through a Lava Lamp

This is my first shader - a learning experiment before a technical interview. 
I used [Shadertoy](https://www.shadertoy.com/) for fast prototyping within the limited time I had, avoiding the need to set up an environment.

This fragment shader that was supposed to simulate realistic water waves with dynamic lighting effects. 
However, it looks more like watching a hospital ceiling through a lava lamp, and I find myself preferring that description! :D 

The shader can be 

This shader demonstrates several simulation techniques including:
- Multiple overlapping waves with different frequencies and directions
- Dynamic wave movement and animation
- Depth-based coloration
- Specular highlights on wave crests
- Edge shallowing effects

## 🔗 Live Version  
You can view the shader live on Shadertoy:  
[Shadertoy Link](https://www.shadertoy.com/view/t3f3Dl)  


## Demo

[Screenshot](./screenshots/screenshot-1.png)


[Demo Video](./demo/shader-demo.webm)

## Learning Process

I created this shader as part of my preparation for a technical interview, with limited time to learn the concepts. To accelerate my understanding, I used:
- Online GLSL tutorials
- Reference examples
- LLM assistance to improve and help explain the code and underlying concepts

This approach allowed me to quickly grasp how fragment shaders work, the mathematics behind wave generation, and color manipulation techniques - all while creating something visually interesting.

## Implementation

The shader uses overlapping sine waves with varying parameters to create movement. Key features:
- Four combined sine waves with different directions, speeds, and amplitudes (possibility to experiment with adding more waves for different results)
- Dynamic depth calculation based on wave height
- Specular reflection simulation for light reflections
- Subtle highlights on wave crests
- Edge effects for visual interest

## Usage

This shader can be used in any environment that supports GLSL fragment shaders, including:
- [Shadertoy](https://www.shadertoy.com/)
- WebGL applications
- Three.js
- Game engines like Unity or Unreal (with minor modifications)

## Code

The full shader code is available in [shader.glsl](./shader.glsl).

## License

[MIT License](./LICENSE)
