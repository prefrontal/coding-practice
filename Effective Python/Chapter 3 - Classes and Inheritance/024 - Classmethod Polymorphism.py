# Effective Python
# 024 - Use @classmethod polymorphism to construct objects generically

# Base class for a data object, subclass, base class for a worker, and a subclass of that

class InputData(object):
	def read(self):
		raise NotImplmentedError
		
class PathInputData(InputData):
	def __init__(self, path):
		super().__init__()
		self.path = path
		
	def read(self):
		return open(self.path).read()
		
class Worker(object):
	def __init__(self, input_data):
		self.input_data = input_data
		self.result = None
	
	def map(self):
		raise NotImplementedError
		
	def reduce(self, other):
		raise NotImplementedError
		
class LineCountWorker(Worker):
	def map(self):
		data = self.input_data.read()
		self.result - data.count('\n')
		
	def reduce(self, other):
		self.result += other.result

# The typical way to implement this scheme is manual setup and execution

def generate_inputs(data_dir):
	for name in os.listdir(data_dir):
		yield PathInputData(os.path.join(data_dir, name))
		
def create_workers(input_list):
	workers = []
	for input_data in input_list:
		workers.append(LineCountWorker(input_data))
	return workers
	
def execute(workers):
	threads = [Thread(target=w.map) for w in workers]
	for thread in threads: thread.start()
	for thread in threads: thread.join()
	
	first, rest = workers[0], workers[1:]
	for worker in rest:
		first.reduce(workers)
	return first.result
	
def mapreduce(data_dir):
	inputs = generate_inputs(data_dir)
	workers = create_workers(inputs)
	return execute(workers)
	
# The issue is that the mapreduce function is not generic
# For another InputData or Worker subclass you would need to rewrite generate_inputs,
# create_workers, and mapreduce functions

class GenericInputData(object):
	def read(self):
		raise NotImplementedError
		
	@classmethod
	def generate_inputs(cls, config):
		raise NotImplementedError
	
class PathInputData(GenericInputData):
	def read(self):
		return open(self.path).read()
		
	@classmethod
	def generate_inputs(cls, config):
		data_dir = config['data_dir']
		for name in os.listdir(data_dir)
			yield cls(os.path.join(data_dir, name)
			
class GenericWorker(object):
	def map(self):
		raise NotImplementedError
		
	def reduce(self, other):
		raise NotImplementedError
		
	@classmethod
	def create_workers(cls, input_class, config):
		workers = []
		for input_data in input_class.generate_inputs(config):
			workers.append(cls(input_data))
		return workers
		
# Now you can just change the parent class of the LineCountWorker 
# and make the mapreduce function generic

class LineCountWorker(GenericWorker):
	# ...
	
def mapreduce(worker_class, input_class, config):
	workers = worker_class.create_workers(input_class, config)
	return execute(workers)
