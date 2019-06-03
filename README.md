# UberAppProject

## The Task
Uber have released an example application that uses their external API. It is built in Python using flask.
Your job is to create working development, testing and production environments and to build a pipeline to move the code through them using Jenkins.

## How to Install
- To begin, clone the GitHub repository [HERE](https://github.com/ARLeslie95/UberAppProject)
- Navigate into the UberAppProject file and run `berks vendor cookbooks`
- Now run `vagrant up` to start the application.
- Open your internet browser and type [http://development.local](http://development.local)
- If successful you will see this page.

![UberAppPage](./images/uber_app_page.png)

## Further Development
If you wish to perform updates on the repository follow the below steps.
- Change to the 'dev' branch using `git checkout dev`
- Make the changes
- Then Push to the 'dev' branch using `git push origin dev`
- From here the process is automatic, see below for more information.

## The Pipeline
The UberAppProject has a development pipeline.
This is what happens when you make changes and push to the 'dev' branch.
- Push to development branch.
- Jenkins webhook is activated automatically.
- Jenkins then runs the code against the written tests.
- If the code passes then it is automatically merged to master.
- A second Jenkins job is activated on completion of the last.
- Jenkins then interacts with Amazon Web Services and creates a Amazon Machine Image. l
