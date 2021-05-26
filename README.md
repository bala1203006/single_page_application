These are information about this application
* ruby - 2.5.1
* rails - 6.1.3.2
* database - postgres
* branch - master

Steps to install application
* bundle install
* intially create these 2 databases => hcl_sample_app, hcl_sample_app_test
* rake db:migrate
* rake import
* rake #its for run the test cases

- Here we defined predefined values for roles, mappings, questions in the CSV file, its defined /deb folder, the above comment will create the datas

* http://localhost:3000/ => it will render the application views
* we can create , update, destroy the questions