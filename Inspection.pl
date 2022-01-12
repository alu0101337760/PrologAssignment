%listing and looking
has_something(Thing) :- located(_, Thing).
list_things(Place) :- located(X, Place), tab(2), write(X), nl, fail.
list_things(_).

has_locked_connection(Place) :-door_connection(Place, _, closed).
list_locked_connections(Place) :- door_connection(Place, X, closed), tab(2), write('to '), write(X), nl, fail.

list_connections(Place) :- door_connection(Place, X, open), tab(2), write(X), write(' through a door'), nl, fail.
list_connections(Place) :- trapdoor_connection(Place, X, open), tab(2), write(X), write(' through a trapdoor'), nl, fail.
list_connections(Place) :- stairs_connection(Place, X, open), tab(2), write(X), write(' through the stairs'), nl, fail.
list_connections(_).



look :- here(Place), 
        write('You are in the '), write(Place), nl, nl,
        inspect(Place), nl,
        write('You can go to:'), nl, list_connections(Place),
        ((has_locked_connection(Place), write('There are locked doors: '), nl, list_locked_connections(Place)) ; true).

%inspect
inspect(Thing) :- flavor_text(Thing),nl,  ((has_something(Thing), fail) ; not(has_something(Thing)), write(Thing), write(' has nothing.'), nl).
inspect(Thing) :- write(Thing), write(' has:'), nl, list_things(Thing), nl, !.
inspect(_) :- write('What are you expecting this to tell you? There is literally nothing special about it').

%flavor text

flavor_text('main entrance') :-     write('The long red carpet on the floor, tall paintings of '), nl, 
                                write('previous lords and chandeliers give the room an ominous feeling'), nl.                                
flavor_text('hidden room'):-        write('Wow! you found a hidden room! Damn it looks like it was so well hidden,'), nl,
                                write('even the owners of the mansion did''t know it existed, there''s nothing inside.'), nl.
flavor_text('bathroom'):-           write('Its a very well cleaned bathroom, the maid must have done a good job, but they left the plunger on the toilet...').
flavor_text('trophy room'):-        write('It looks like Lord Shepard liked to hunt. The room is full of hunting trophies'), nl,
                                write('and a very dangerous looking crossbow in the wall.'), nl.
flavor_text('library'):-            write('Wow! a private library. Damn this Shepard dude is such a nerd, what a loser'), nl,
                                write('There are lots of books on the shelves in every wall on the room, and a singular bureau in the middle.'), nl,
                                write('Strangely there''s only one red book...'), nl.
flavor_text('bedroom'):-            write('Lord Shepard has a very bad taste for interior decoration, his bedroom doesn''t fit with the rest of the mansion.'), nl,
                                write('You can''t tell why but you get the feeling that they are very cheap swedish furniture made of wood-chip planks...'), nl,
                                write('There is a hanger next to the window with a red coat on it.'), nl.
flavor_text('basement') :-          write('No way! the trap door suddently locked behind you and a very epic and tense music starts playing'), nl,
                                write('In the middle of the basement, barely iluminated you can see him, Lord Shepard, the weresheep.'), nl,
                                write('He looks very angry and wooly...'), nl.         
flavor_text('maid room') :-         write('Damn this is the saddest room ever to exist, it looks like it was used to store potatoes.'), nl,
                                write('There''s a female corpse decomposing in the corner of the room and a silver spoon in the floor next to it.').
flavor_text('hallway') :-           write('A very impressive hallway filled with lots and lots of interesting stuff,'), nl,
                                write('like doors.'), nl.
flavor_text('kitchen') :-           write('Its a very large kitchen!, full of ingredients and cooked food, it smells very good, but you get a brief scent'), nl,
                                write('of rotten, probably something has spoiled. There''s a big kitchen table in the middle of the room and one of the'), nl,
                                write('cupboard door is open.'), nl.
flavor_text('living room') :-       write('Very cozy living room! it has a lit fireplace keeping everything nice and warm. There''s also a round table'), nl,       
                                write('and some comfortable looking sofas.'), nl.
flavor_text('dining hall') :-       write('Wow how mainstream, a very very very long table with a candle holder and a chair in both ends,'), nl, 
                                write('what else did you expect from a Lord''s mansion''s dining hall?'), nl.

flavor_text('page1') :- write('I have just accepted the job for lord shepard.'), nl, 
write('He seems to be a reserved man, good.'), nl, 
write('Hopefully he is not too demanding and I''ll have an easier time,'), nl, 
write('I feel like his mansion is too big for only one maid to handle...'),nl.

flavor_text('page2') :- write('This is preposterous! I am enraged!'), nl, 
write('The lord keeps me in a dark and humid burrow next to the kitchen,'), nl,
write('and he has the audacity to call it a room!'), nl, 
write('There''s only one ''window'' as the lord calls it in the room, a hole close to the ceiling...'),nl.

flavor_text('page3') :- write('The nauseating smell of the pigs feces swarms the room during the day.'), nl,
write('I have tried to perfumate the room and block the hole (that faces the barn).'), nl, 
write('I have never been subjected to this kind of inhumane living conditions. Measures must be taken...'),nl.

flavor_text('page4') :- write('While buying meat in the market, I heard two grandmas'), nl, 
write('talking about a mysterious hag that lives in the forest up north.'), nl, 
write('They claimed she was a witch, I don''t believe that nonsense,'), nl, 
write('but Lord Shepard seems to be superstitious... '), nl, 
write('Maybe I can scare him enough to give me a decent room.'), nl,
write('Heh, I''ll ask the witch for a ''curse'' to turn him into a werewolf,'), nl, 
write('that''s so clever of me, because he''s called shepard,'), nl, 
write('and shepards don''t like wolves hehehe, did you get it?'),nl.

flavor_text('page5') :- writef(
'I am terrified, the curse actually worked, it didn''t turn him into a werewolf...\n
But into a weresheep! Exactly the same as a werewolf but as a sheep,\n
even though his wool seems as soft as a cloud he is very aggressive...\n
I pushed him into the basement''s trap door and managed to lock him,\n
but he mortally wounded me. I''m about to die soon...\n 
If someone is reading me, please, avenge me...\n
weresheep are famous for actually being immortal and being immune to everything\n
except for silver...\n
also for being scared by wolves and having very soft wool.'),nl.

flavor_text('red book') :- write('It is a big and red book, its title says ''PULL ME'', what a suspicious book.'), nl.

