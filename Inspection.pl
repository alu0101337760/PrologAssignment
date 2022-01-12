%listing and looking
list_things(Place) :- located(X, Place), tab(2), write(X), nl, fail.
list_things(_).

list_connections(Place) :- door_connection(Place, X, open), tab(2), write(X), write(' through a door'), nl, fail.
list_connections(Place) :- trapdoor_connection(Place, X, open), tab(2), write(X), write(' through a trapdoor'), nl, fail.
list_connections(Place) :- stairs_connection(Place, X, open), tab(2), write(X), write(' through the stairs'), nl, fail.
list_connections(_).

look :- here(Place), 
        write('You are in the '), write(Place), nl, nl,
        flavor_text(Place), nl,
        inspect(Place), nl,
        write('You can go to:'), nl, list_connections(Place).

%inspect 

flavor_text('main entrance') :-     write('The long red carpet on the floor, tall paintings of '), nl, 
                                write('previous lords and chandeliers give the room an ominous feeling'), nl.                                
flavor_text('hidden room'):-        write('Wow! you found a hidden room! Damn it looks like it was so well hidden,'), nl,
                                write('even the owners of the mansion did''t know it existed, there''s nothing inside'), nl.
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

flavor_text('page1') :- writef(
'I have just accepted the job for lord shepard.\n
He seems to be a reserved man, good.\n
Hopefully he is not too demanding and I''ll have an easier time,\n
I feel like his mansion is too big for only one maid to handle...').

flavor_text('page2') :- writef(
'This is preposterous! I am enraged! \n
The lord keeps me in a dark and humid burrow next to the kitchen,\n
and he has the audacity to call it a room!\n
There''s only one ''window'' as the lord calls it in the room, a hole close to the ceiling...').

flavor_text('page3') :- writef(
'The nauseating smell of the pigs feces swarms the room during the day.\n
I have tried to perfumate the room and block the hole (that faces the barn).\n
I have never been subjected to this kind of inhumane living conditions. Measures must be taken...').

flavor_text('page4') :- writef(
'While buying meat in the market, I heard two grandmas\n
talking about a mysterious hag that lives in the forest up north.\n
They claimed she was a witch, I don''t believe that nonsense,\n
but Lord Shepard seems to be superstitious... \n
Maybe I can scare him enough to give me a decent room.\n
Heh, I''ll ask the witch for a ''curse'' to turn him into a werewolf,\n
that''s so clever of me, because he''s called shepard,\n
and shepards don''t like wolves hehehe, did you get it?').

flavor_text('page5') :- writef(
'I am terrified, the curse actually worked, it didn''t turn him into a werewolf...\n
But into a weresheep! Exactly the same as a werewolf but as a sheep,\n
even though his wool seems as soft as a cloud he is very aggressive...\n
I pushed him into the basement''s trap door and managed to lock him,\n
but he mortally wounded me. I''m about to die soon...\n 
If someone is reading me, please, avenge me...\n
weresheep are famous for actually being immortal and being immune to everything\n
except for silver...\n
also for being scared by wolves and having very soft wool.').

flavor_text('red book').


inspect(Thing) :- write(Thing), write(' has:'), nl, list_things(Thing), nl, !.
inspect(_) :- write('What are you expecting this to tell you? There is literally nothing special about it').
