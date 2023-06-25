#version 430  // version must be first line

// in general, all work carried out here
// shader runs directly on GPU

out vec4 fragColor;

// get the resolution size and time
uniform vec2 resolution;
uniform float time;

void main() {
	// define uv space and adjust coords to -1,+1
	vec2 uv = 2 * (gl_FragCoord.xy - 0.5 * resolution.xy) / resolution.y;

	// define color to paint screen
	vec3 col = vec3(0.0);

	// now can use uv value to define color
	col += length(uv);

	// apply color, so all black!
	fragColor = vec4(col, 1.0);
}