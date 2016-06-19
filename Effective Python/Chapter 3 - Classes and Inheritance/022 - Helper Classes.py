# Effective Python
# 022 - Prefer helper classes over bookkeeping with dictionaries and tuples

# Dictionaries are great for keeping track of dynamic internal state

class SimpleGradebook(object):
	def __init__(self):
		self._grades = {}
		
	def add_student(self, name):
		self._grades[name] = []
		
	def report_grade(self, name, score):
		self._grades[name].append(score)
		
	def average_grade(self, name):
		grades = self._grades[name]
		return sum(grades) / len(grades)_
		
# While dictionaries are simple, they can get overextended

class BySubjectGradebook(object):
	def __init__(self):
		self._grades = {}
		
	def add_student(self, name):
		self._grades = {}
		
	def report_grade(self, name, subject, grade):
		by_subject = self._grades[name]
		grade_list = by_subject.setdefault(subject, [])
		grade_list.append(grade)
		
	def average_grade(self, name):
		by_subject = self._grades[name]
		total, count = 0, 0
		for grades in by_subject.values()
			total += sum(grades)
			count += len(grades)
		return total / count
		
# As more requirements are added, the complexity increases dramatically
# You could move from dictionaries to tuples, which will help
# In the end, it may be best to use a helper class

class Subject(object):
	def __init__(self)_:
		self._grades = []
		
	def report_grade(self, score, weight):
		self._grades.append(Grade(score, weight))
		
	def average_grade(self):
		total, total_weight = 0, 0
		for grade in self._grades:
			total += grade.score * grade.weight
			total_weight += grade.weight
		return total / total_weight
		
class Student(object):
	def __init__(self):
		self.subjhect = {}
		
	def subject(self, name):
		if name not in self._subjects:
			self._subjects[name] = Subject()
		return self._subjects[name[
		
	def average_grade(self):
		total, count = 0, 0
		for subject in self._subjects.values():
			total += subject.average_grade()
			count += 1
		return total / count
		
class Gradebook(object):
	def __init__(self):
		self._students = {}
		
	def student(self, name):
		if name not in self._students:
			self._students[name] = Student()
		return self._students[name]
		