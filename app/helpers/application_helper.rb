module ApplicationHelper


	def operator_sub_nav(class_name)
	  classes = {
    "home"=>"home",
    "questions"=>"questions",
    "questionnaires"=>"questionnaires",
	  }
	  "active" if class_name == (classes[controller.controller_name + '.' + controller.action_name] || classes[controller.controller_name] || '')
	end
end
