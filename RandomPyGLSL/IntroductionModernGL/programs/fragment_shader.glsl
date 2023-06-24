#version 430  // version must be first line

// in general, all work carried out here
// shader runs directly on GPU

out vec4 fragColor;

void main() {
	// define color to paint screen
	vec3 col = vec3(0.0);

	// apply color, so all black!
	fragColor = vec4(col, 1.0);
}