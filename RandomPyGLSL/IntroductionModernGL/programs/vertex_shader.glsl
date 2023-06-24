#version 430 // GLSL langauge version used

in vec3 in_position;  // screen vertex coords

void main() {
	// coords go from -1 to +1
	// this is the same as vec4(in_position.x, in_position.y, in_position.z, 1)
	gl_Position = vec4(in_position, 1);
}