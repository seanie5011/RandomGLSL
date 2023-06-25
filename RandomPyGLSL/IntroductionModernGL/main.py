# dependancies
import moderngl_window as mglw

# App window
# inherit from a mglw class
class App(mglw.WindowConfig):
	# set resolution
	window_size = 1600, 900
	# define folder with shader attributes
	resource_dir = 'programs'

	def __init__(self, **kwargs):
		# super() on this will automatically create:
		# the OpenGL context, the window instance, the timer instance
		super().__init__(**kwargs)

		# create screen aligned quad
		# this is a plane with 4 vertices and will be used as the display
		self.quad = mglw.geometry.quad_fs()

		# load vertex and fragment shaders
		self.prog = self.load_program(
			vertex_shader='vertex_shader.glsl',
			fragment_shader='fragment_shader.glsl',
		)

		# assign resolution to the uniform values
		self.set_uniform('resolution', self.window_size)

	# set the uniform values
	def set_uniform(self, u_name, u_value):
		# assign value to that uniform key
		try:
			self.prog[u_name] = u_value
		# if the key does not exist
		except KeyError:
			print(f'uniform: {u_name} - not used in shader')

	# automatically called each frame
	def render(self, time, frame_time):
		# clear frame buffer
		self.ctx.clear()

		# assign time to the uniform values
		self.set_uniform('time', time)

		# render new frame
		self.quad.render(self.prog)

# main running
if __name__ == '__main__':
	# run window
	mglw.run_window_config(App)