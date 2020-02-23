# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

quiz1 = Quiz.create!(
    title: 'MVC Concepts',
    description: 'This quiz covers concepts related to the Model-View-Controller web application architecture.'
)

quiz2 = Quiz.create!(
    title: 'Rails Concepts',
    description: 'This quiz covers concepts related to web application development using the Ruby on Rails platform.'
)

q1 = McQuestion.create!(
    quiz: quiz1,
    question: 'What does the M in MVC stand for?',
    answer: 'Model',
    distractor_1: 'Media',
    distractor_2: 'Mode'
)

q2 = McQuestion.create!(
    quiz: quiz1,
    question: 'What does the V in MVC stand for?',
    answer: 'View',
    distractor_1: 'Verify',
    distractor_2: 'Validate'
)

q3 = McQuestion.create!(
    quiz: quiz1,
    question: 'What does the C in MVC stand for?',
    answer: 'Controller',
    distractor_1: 'Create',
    distractor_2: 'Code'
)

q4 = McQuestion.create!(
    quiz: quiz2,
    question: 'Which hash is primarily used for one way message passing from the controller to the view?',
    answer: 'flash',
    distractor_1: 'session',
    distractor_2: 'params'
)

q5 = McQuestion.create!(
    quiz: quiz2,
    question: 'In which folder are image assets for the QuizMe app stored?',
    answer: 'quiz-me/app/assets/images',
    distractor_1: 'quiz-me',
    distractor_2: 'quiz-me/images'
)

q6 = McQuestion.create!(
    quiz: quiz2,
    question: 'Which standard RESTful controller action is used to remove records?',
    answer: 'destroy',
    distractor_1: 'delete',
    distractor_2: 'remove'
)
