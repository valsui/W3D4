# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all
#### Users 
arthur = User.create(username: 'aardvarksRule23')
penelope = User.create(username: 'princessP')
nick = User.create(username: 'niceNick41')
val = User.create(username: 'NoPollsVal')
ryan = User.create(username: 'idontcare_65')

### Polls

poll1 = Poll.create(title: 'Sneakers or Sandals', author_id: penelope.id)
poll2 = Poll.create(title: 'Aardvards or Ants', author_id: arthur.id)


##### Questions 

q1 = Question.create(poll_id: poll1.id, text: 'Do you like feet?')
q2 = Question.create(poll_id: poll1.id, text: 'Do you like shoes?')

q3 = Question.create(poll_id: poll2.id, text: 'Do long noses scares you?')



#### Answer choices 

a1 = AnswerChoice.create(question_id: q1.id, text: 'YesSSSSSS')
a2 = AnswerChoice.create(question_id: q1.id, text: 'NUuUUUUU')

a3 = AnswerChoice.create(question_id: q2.id, text: 'Yes')
a4 = AnswerChoice.create(question_id: q2.id, text: 'Maybe')

a5 = AnswerChoice.create(question_id: q3.id, text: 'Yiiiis')
a6 = AnswerChoice.create(question_id: q3.id, text: 'Nuh')

#### Responses

r1 = Response.create(user_id: val.id, answer_id: a1.id)
r2 = Response.create(user_id: val.id, answer_id: a3.id)
r3 = Response.create(user_id: nick.id, answer_id: a4.id)
r4 = Response.create(user_id: nick.id, answer_id: a5.id)
r5 = Response.create(user_id: ryan.id, answer_id: a6.id)
r6 = Response.create(user_id: ryan.id, answer_id: a2.id)
















