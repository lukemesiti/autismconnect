Role.delete_all
User.delete_all
Event.delete_all
Article.delete_all
Link.delete_all


# Roles
admin =  Role.find_or_create_by_name "admin"
parent =  Role.find_or_create_by_name "parent"
professional =  Role.find_or_create_by_name "professional"


# Users
user = User.new
user.email = 'user@test.com'
user.password = 'password'
user.name = 'Dory'
user.street_address = 'P. Sherman 42 Wallaby Way'
user.city = 'Sydney'
user.state = 'NSW'
user.postcode = 2000
user.phone_number = 5
user.number_of_children = 1
user.role = parent
user.save

user2 = User.new
user2.email = 'doctor@test.com'
user2.password = 'password'
user2.name = 'Dr. Jones'
user2.street_address = '455 Random St'
user2.city = 'Sydney'
user2.state = 'NSW'
user2.postcode = 2000
user2.business_name = 'Jones Psychology Practice'
user2.phone_number = 2
user2.website = 'http://testwebsitejones.com'
user2.role = professional
user2.save

user3 = User.new
user3.name = 'admin'
user3.email = 'admin@admin.com'
user3.password = 'password'
user3.role = admin
user3.save

if !Rails.env.production?
  # Events
  event = Event.new
  event.name = "The Lion King - autism friendly performance"
  event.address = 'Capitol Theatre - 13 Campbell St, Haymarket NSW 2000'
  event.description = "Disney's THE LION KING is working closely with Autism Awareness Australia to create a friendly and supportive environment to enjoy this award-winning musical.The specially adapted performance will be suitable for individuals on the autism spectrum and their families, with trained staff on hand and dedicated quiet and activity areas should anyone need to leave their seats. Slight adjustments to the production will include reduction of any jarring sounds or lights focused into the audience."
  event.category = "entertainment"
  event.cost = 50.00
  event.dateTime = "2014-06-14 13:30:00 UTC"
  event.capacity = 2094
  event.website = "http://www.disney.com.au/lionkingautismfriendly/"
  event.save

  event2 = Event.new
  event2.name = "World Autism Awareness Day Melbourne 2014"
  event2.address = "Luna Park - 18 Lower Esplanade, ST KILDA 3182"
  event2.description = "Come along and have the chance to access Luna Park exclusively for 2 hours and for the great price of $10!There will music, exhibitors and lots of fun activities. There will also be a dove release to mark the occasion.Luna Park is close to St. Kilda Beach, Acland and Fitzroy Streets as well as the St. Kilda Botanical Gardens so there is plenty to do in the area to celebrate the day!"
  event2.category = "entertainment"
  event2.cost = 10.00
  event2.dateTime = "2014-04-06 09:00:00 UTC"
  event2.capacity = 10000
  event2.website = "http://www.amaze.org/au/events-info/waad"
  event2.save

  event3 = Event.new
  event3.name = "World Autism Awareness Day Light It Up Blue"
  event3.description = "Each April 2, Autism Speaks celebrates Light It Up Blue along with the international autism community, in commemoration of the United Nations-sanctioned World Autism Awareness Day. Light It Up Blue is a unique global initiative that kicks-off Autism Awareness Month and helps raise awareness about autism. In honor of this historic day, many iconic landmarks, hotels, sporting venues, concert halls, museums, bridges and retail stores are among the hundreds of thousands of homes and communities that take part to Light It Up Blue."
  event3.category = "raising awareness"
  event3.dateTime = "2014-04-02"
  event3.website = "http://liub.autismspeaks.org/welcome"
  event3.save


  # Articles
  # http://www.parenting.com/article/autism-warning-signs-1204127474106
  article = Article.new
  article.title = "Autism Warning Signs"
  article.subtitle = "Alert your pediatrician if you notice these signs in your baby"
  article.body = "Here, a list of possible warning signs for autism that your doctor may use to determine if your child's development warrants further testing. Remember: Don't panic if your infant exhibits a symptom or two on occasion, but do alert your pediatrician if you notice any of the following: By 2 to 3 months, your baby isn't making frequent eye contact.
    By 3 months, he isn't smiling at you and the sound of your voice.
    By 6 months, he doesn't laugh or make other joyful expressions.
    Around 8 months, he isn't following your gaze when you look away from him towards something else.
    By 9 months, he hasn't begun to babble.
    By 1 year, he isn't consistently turning to you when you call his name
    By 1 year, he shows a general disregard for vocalizations (ie, lack of response to his name), but has a keen awareness of environmental sounds.
    By 1 year, he isn't engaging in back-and-forth vocalizations with you.
    By 1 year, he hasn't begun to wave bye-bye.
    By 1 year, he isn't 'following a point' (looking towards something you point at).
    By 16 months, he has no words.
    By 18 months, he isn't pointing to things that interest him.
    By 24 months, he has no two-word meaningful phrases.
    At any time, he shows a loss of any of his previously mastered skills."
  article.tag_list = ["autism", "babies", "symptoms"]
  article.user_id = 1
  article.save

  # http://www.autism.org.uk/living-with-autism/real-life-stories/real-life-stories-from-parents-and-carers/it-is-a-long-and-rocky-road.aspx
  article2 = Article.new
  article2.title = "It is a long and rocky road"
  article2.subtitle = "Real-life stories from parents and carers"
  article2.body = "My son was first diagnosed with Asperger syndrome at the age of eight, after five long years of wondering why he was different, why he was not the same as his friends. His diagnosis came as a huge relief and I thought it would get us the help we so desperately needed. But, oh boy was I wrong, it was just the start of an even longer struggle!
  I have fought a high court battle and an educational tribunal and spent over £60,000. I have had to sell my house and my car, nearly ruined my own health and many relationships in the process.
  I begged for help from educational institutions to social services and lost all my dignity only to be turned away. I found the Disability Discrimination Act (1995) didn’t mean an awful lot: whenever my son raged in class the teachers always commented they were sorry but 'had to protect all the other children'. Whilst I understood their position, it left me with no other help to turn to and my son kept wondering what he had done so wrong.
  We both felt very lost, depressed and confused and most of all let down.
  My son was at least four years behind his peers, often sat outside the classroom and was even excluded from the playground. He was so anxious that he pulled his hair out and punched his arms. The school would not accept his condition and classed him as naughty and me as a bad parent, instead. 
  The good news is that after a two year educational battle which tore every last shred of us both we won and he was awarded a placement in a special needs school that provides the specialist help he so desperately required. 
  He is now 11 and has been in the school for six months. The progress he made with the right input in this a short space of time has been amazing. Never before has he had the confidence to pick up a pen and write, and he is not afraid of getting his work wrong.
  He is learning for the first time in his life and is greatly enjoying it. He no longer pulls out his hair and has so much confidence. He is in a school that understands him and he now has a great future ahead.  He is no longer classed as 'that naughty boy' but a child that is 'good at art and woodwork', the boy that has a 'great sense of humour', not 'the odd boy'.
  My message would be to never give up fighting, there is light at the end of the tunnel and it is very very much worth while. You will get there but unfortunately, it is a long and rocky road. I just wished there was more help out there for ASD parents, adults and children and really hope the government realises that having an autism spectrum disorder is hard enough, let alone fight for basic needs.
  What I can’t figure out is why the government does not invest in ASD early on as they will end up paying a lot more at a later stage.  Failure to invest in good specialist education only means that individuals are forces to live off benefits and are much more likely to be a burden on the healthcare system when mental health issues arise as a consequence of the lack of adequate care and education. 
  Good luck to you all, keep on fighting it will be worth it in the end!"
  article2.tag_list = ["autism", "children", "Asperger", "education"]
  article2.user_id = 1
  article2.save


  # Links
  link = Link.new
  link.name = "Autism Association of Western Australia"
  link.url = "http://www.autism.org.au/"
  link.save

  link2 = Link.new
  link2.name = "Autism Awareness"
  link2.url = "http://www.autismawareness.com.au/information/support"
  link2.save

  link3 = Link.new
  link3.name = "Autism Victoria - Amaze"
  link3.url = "http://www.amaze.org.au/"
  link3.save
end