void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Normalized pixel coordinates
    vec2 uv = fragCoord / iResolution.xy;
    
    // Scaled UV for more realistic water waves
    vec2 scaledUV = uv * vec2(iResolution.x / iResolution.y, 1.0) * 2.0;
    
    // Water parameters
    float time = iTime * 0.3;
    float waterDepth = 0.6;
    
    // Create overlapping waves with different frequencies and directions
    float wave1 = sin(scaledUV.x * 3.0 + scaledUV.y * 1.0 + time * 1.1) * 0.05;
    float wave2 = sin(scaledUV.x * 1.8 - scaledUV.y * 2.0 + time * 0.7) * 0.07;
    float wave3 = sin(scaledUV.x * 0.6 + scaledUV.y * 1.3 + time * 1.4) * 0.03;
    float wave4 = sin(scaledUV.x * 2.5 + scaledUV.y * 2.6 + time * 0.8) * 0.02;
    //float wave5 = sin(scaledUV.x * 4.0 + scaledUV.y * 1.0 + time * 0.4) * 0.08;
    //float wave6 = sin(scaledUV.x * 0.4 + scaledUV.y * 2.0 + time * 2.0) * 0.01;
    //float wave7 = sin(scaledUV.x * 2.1 + scaledUV.y * 3.0 + time * 1.0) * 0.12;
    
    // Combine all waves
    float waveHeight = wave1 + wave2 + wave3 + wave4;
    
    // Distorted coordinates for refraction effect
    vec2 distortedUV = uv + vec2(waveHeight * 0.1, waveHeight * 0.1);
    
    // Water colors - from light cyan in shallow areas to deep blue
    vec3 shallowWater = vec3(0.1, 0.7, 0.8);
    vec3 deepWater = vec3(0.0, 0.2, 0.5);
    
    // Add water depth based on wave height
    float depth = waterDepth + waveHeight * 2.0;
    depth = clamp(depth, 0.0, 1.0);
    
    // Mix water colors based on depth
    vec3 waterColor = mix(shallowWater, deepWater, depth);
    
    // Specular effect (light reflections on water)
    float specular = pow(max(0.0, 1.0 - length(vec2(
        mod(scaledUV.x + waveHeight * 2.0, 1.0) - 0.5,
        mod(scaledUV.y - waveHeight * 1.5, 1.0) - 0.5
    )) * 2.0), 8.0) * 0.8;
    
    // Additional subtle highlights on wave crests
    float highlights = pow(max(0.0, 1.0 - abs(waveHeight) * 10.0), 6.0) * 0.5;
    
    // Combine water color with highlights
    waterColor += vec3(specular);
    waterColor += vec3(highlights);
    
    // Add shallowness effect at the edges
    float edgeShallow = smoothstep(0.48, 0.5, abs(uv.y - 0.5));
    waterColor = mix(waterColor, shallowWater * 1.2, edgeShallow);
    
    // Final color output
    fragColor = vec4(waterColor, 1.0);
}