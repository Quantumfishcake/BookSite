

Author.destroy_all
a1 = Author.create :name => 'Brandon Sanderson'
a2 = Author.create :name => 'George R.R Martin'
a3 = Author.create :name => 'J.R.R. Tolkien'
a4 = Author.create :name => 'Ernest Hemingway'

Book.destroy_all
b1 = Book.create :title => 'The old man and the sea'
b2 = Book.create :title => 'The way of the kings'
b3 = Book.create :title => 'Lord of the Rings'
b4 = Book.create :title => 'Game of Thrones'

Group.destroy_all
g1 = Group.create :name => 'Technology'
g2 = Group.create :name => 'Fantasy'
g3 = Group.create :name => 'Sci-Fi'
g4 = Group.create :name => 'Biography'


#associations
#albums and songs
a1.books << b2
a2.books << b4
a3.books << b3

#artists and songs
g4.books << b1
g2.books << b2 << b3 << b4
