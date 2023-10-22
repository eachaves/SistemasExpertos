mostrar(V,D,M):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1),
        send(D1,below(M)).

:- pce_global(@name_prompter, make_name_prompter).

        make_name_prompter(P) :-
                new(P, dialog),
                send(P, kind, transient),
                send(P, append, label(prompt)),
                send(P, append,
                        new(TI, text_item(name, '',
                                 message(P?ok_member, execute)))),
                send(P, append, button(ok, message(P, return, TI?selection))),
                %%send(P, append, button(ok, message(@prolog,pp))),
                send(P, append, button(cancel, message(P, return, @nil))).

        ask_name(Prompt, Label, Name) :-
                send(@name_prompter?prompt_member, selection, Prompt),
                send(@name_prompter?name_member, label, Label),
                send(@name_prompter?name_member, clear),
                get(@name_prompter, confirm_centered, RawName),
                send(@name_prompter, show, @off),
                RawName \== @nil,
                Name = RawName.

        ask_name:-
                  ask_name('Estadisticas del Auto','Auto',Datos),
                  pp(Datos).

        ask_name1:-
                  ask_name('Relacion por:','Combustible',Combustible),
                  pp1(Combustible).

        ask_name2:-
                  ask_name('Buscar','Auto:',Datos),
                  pp(Datos).

        ask_name3:-
                  ask_name('Relacion por: ','Motor:',Motor),
                  pp3(Motor).
                  
        ask_name4:-
                  ask_name('Relacion por: ','Año:',Año),
                  pp4(Año).

        start:-
               new(D,dialog('SISTEMA EXPERTO DE AUTOS')),
               send(D,size,size(750,450)),
               send(D,colour,colour(red)),
               send(D,append,new(Menu,menu_bar)),
               send(Menu,append,new(Iniciar,popup('Estadisticas'))),
               send(Menu,append,new(Iniciar1,popup('Relacion por: '))),
               send_list(Iniciar,append,
                      [menu_item(auto,message(@prolog,ask_name))
                      ]),
               send_list(Iniciar1,append,
                      [menu_item(combustion,message(@prolog,ask_name1))
                      ]),
               send_list(Iniciar1,append,
                      [menu_item(motor,message(@prolog,ask_name3))
                      ]),
               send_list(Iniciar1,append,
                      [menu_item('Año',message(@prolog,ask_name4))
                      ]),
               mostrar('C:/PROYECTO PROLOG/CARROS/menu.jpg',D,Menu),
               send(D,open,point(0,0)),
               consult('coches.pl'),
               nl.

iman('A1 ATTRACTION','C:/PROYECTO PROLOG/CARROS/A1 2014 - 1.png').
iman('A1 SPORTBACK','C:/PROYECTO PROLOG/CARROS/A1 SPORTBACK - 2.png').
iman('A1 AMBITION','C:/PROYECTO PROLOG/CARROS/A1 AMBITION 3.png').
iman('A3 TFSI','C:/PROYECTO PROLOG/CARROS/A3 TFSI - 5.png').
iman('A3 CABRIO','C:/PROYECTO PROLOG/CARROS/A3 CABRIO - 6.png').
iman('A3 SEDAN','C:/PROYECTO PROLOG/CARROS/A3 SEDAN - 7.png').
iman('A3','C:/PROYECTO PROLOG/CARROS/A3 - 9.png').
iman('A3 CABRIOLET','C:/PROYECTO PROLOG/CARROS/A3 CABRIO - 10.png').
iman('A4 B9','C:/PROYECTO PROLOG/CARROS/A4 B9 - 12.png').
iman('A4 ALLROAD','C:/PROYECTO PROLOG/CARROS/A4 ALLROAD - 13.png').
iman('A4 B9 AVANT','C:/PROYECTO PROLOG/CARROS/A4 AVANT - 14.png').
iman('A4 RESTYLING','C:/PROYECTO PROLOG/CARROS/A4 RESTYLING - 15.png').
iman('A5','C:/PROYECTO PROLOG/CARROS/A5 - 16.png').
iman('A5 COUPE','C:/PROYECTO PROLOG/CARROS/A5 COUPE - 17.png').
iman('A8 D3','C:/PROYECTO PROLOG/CARROS/A8 D3 - 18.png').
iman('A8 D2','C:/PROYECTO PROLOG/CARROS/A8 D2 - 19.png').
iman('R8 SPYDER','C:/PROYECTO PROLOG/CARROS/R8 SPYDER - 20.png').
iman('A6 C6','C:/PROYECTO PROLOG/CARROS/A6 C6 - 41.png').
iman('A6 C7','C:/PROYECTO PROLOG/CARROS/A1 SPORTBACK - 4.png').
iman('ALLROAD','C:/PROYECTO PROLOG/CARROS/ALLROAD - 8.png').
iman('A6 AVANT','C:/PROYECTO PROLOG/CARROS/A6 AVANT - 11.png').
iman('A6 L C6','C:/PROYECTO PROLOG/CARROS/A6L C6 - 42.png').
iman('A6 C5','C:/PROYECTO PROLOG/CARROS/A6 C5 - 43.png').
iman('A6 C4','C:/PROYECTO PROLOG/CARROS/A6 C4 - 44.png').
iman('A7 SPORTBACK','C:/PROYECTO PROLOG/CARROS/A7 SPORTBACK - 45.png').
iman('Q2','C:/PROYECTO PROLOG/CARROS/Q2 - 46.png').
iman('Q5','C:/PROYECTO PROLOG/CARROS/Q5 - 47.png').
iman('TT COUPE','C:/PROYECTO PROLOG/CARROS/TT COUPE - 48.png').
iman('TT ROADSTER','C:/PROYECTO PROLOG/CARROS/TT ROADSTER - 49.png').
iman('TT 8J','C:/PROYECTO PROLOG/CARROS/TT 8J - 50.png').

iman('GTC4 LUSSO','C:/PROYECTO PROLOG/CARROS/GTCA LUSSO - 21.png').
iman('488 GTB','C:/PROYECTO PROLOG/CARROS/488 GTB - 22.png').
iman('F12 BERLINETTA','C:/PROYECTO PROLOG/CARROS/F12 BERLINETTA - 23.png').
iman('F12 TRS','C:/PROYECTO PROLOG/CARROS/F12 TRS - 24.png').
iman('CALIFORNIA','C:/PROYECTO PROLOG/CARROS/CALIFORNIA - 25.png').
iman('SERGIO','C:/PROYECTO PROLOG/CARROS/SERGIO - 26.png').
iman('458 ITALIA','C:/PROYECTO PROLOG/CARROS/458 ITALIA - 27.png').
iman('LA FERRARI','C:/PROYECTO PROLOG/CARROS/LA FERRARI - 28.png').
iman('FF','C:/PROYECTO PROLOG/CARROS/FF - 29.png').
iman('SA APERTA','C:/PROYECTO PROLOG/CARROS/SA APERTA - 30.png').
iman('CALIFORNIA','C:/PROYECTO PROLOG/CARROS/CALIFORNIA - 31.png').
iman('599','C:/PROYECTO PROLOG/CARROS/599 - 32.png').
iman('GG50','C:/PROYECTO PROLOG/CARROS/GG50 - 33.png').
iman('575 SUPER AMERICA','C:/PROYECTO PROLOG/CARROS/575 SUPERAMERICA - 34.png').
iman('F430','C:/PROYECTO PROLOG/CARROS/F430 - 35.png').
iman('575M','C:/PROYECTO PROLOG/CARROS/575M - 36.png').
iman('ENZO','C:/PROYECTO PROLOG/CARROS/ENZO - 37.png').
iman('360 SPYDER','C:/PROYECTO PROLOG/CARROS/360 SPIDER - 38.png').
iman('360 MODENA','C:/PROYECTO PROLOG/CARROS/360 MODENA - 39.png').
iman('550 BARCHETTA','C:/PROYECTO PROLOG/CARROS/550 BARCHETA - 40.png').
iman('F50','C:/PROYECTO PROLOG/CARROS/F50 - 51.png').
iman('456','C:/PROYECTO PROLOG/CARROS/456 - 52.png').
iman('512','C:/PROYECTO PROLOG/CARROS/512 - 53.png').
iman('348','C:/PROYECTO PROLOG/CARROS/348 - 54.png').
iman('F40','C:/PROYECTO PROLOG/CARROS/F40 - 55.png').
iman('328 GTB','C:/PROYECTO PROLOG/CARROS/328 GTB - 56.png').
iman('412','C:/PROYECTO PROLOG/CARROS/412I - 57.png').
iman('MONDIAL','C:/PROYECTO PROLOG/CARROS/MONDIAL - 58.png').
iman('166','C:/PROYECTO PROLOG/CARROS/166 - 59.png').
iman('195','C:/PROYECTO PROLOG/CARROS/195 - 60.png').


pp(Datos):-
        new(D,dialog(Datos)),
        send(D,size,size(560,500)),
        send(D,colour,colour(black)),
        send(D, append, new(Menu, menu_bar)),
        send(D, display, text(Datos, center, normal), point(220,320)),
        compañia(Datos, Armadora),
        send(D, display, text('Compañia: ', center, normal), point(150,350)),
        send(D, display, text(Armadora, center, normal), point(250,350)),
        creacion(Datos, Armado),
        send(D, display, text('Año de creación: ', center, normal), point(150,365)),
        send(D, display, text(Armado, center, normal), point(270,365)),
        combustion(Datos,Aliment),
        send(D, display, text('Combustible: ', center, normal), point(150,380)),
        send(D, display, text(Aliment, center, normal), point(260,380)),
        velocidades(Datos,Vel),
        send(D, display, text('Caja de cambios: ', center, normal), point(150,395)),
        send(D, display, text(Vel, center, normal), point(260,395)),
        send(D, display, text('velocidades ', center, normal), point(280,395)),
        eficiencia(Datos,Ef),
        send(D, display, text('Eficiencia: ', center, normal), point(150,410)),
        send(D, display, text(Ef, center, normal), point(250,410)),
        velocidad(Datos,Veloz),
        send(D, display, text('Velocidad: ', center, normal), point(150,425)),
        send(D, display, text(Veloz, center, normal), point(250,425)),
        send(D, display, text('km/h ', center, normal), point(280,425)),
        motor(Datos,Mot),
        send(D, display, text('Tipo de motor: ', center, normal), point(150,440)),
        send(D, display, text(Mot, center, normal), point(260,440)),

        iman(Datos,Foto),
        mostrar(Foto,D,Menu),
        send(D,open,point(500,0)),
        nl.
        
pp1(Combustible):-
        new(D,dialog(Combustible)),
        send(D,size,size(500,300)),
        send(D,colour,colour(black)),
        send(D, append, new(Menu, menu_bar)),
        send(D, display, text(Combustible, center, normal), point(100,25)),
        combustion(Auto,Combustible),
        compañia(Auto,Armadora),
        send(D, display, text('Auto: ', center, normal), point(10,40)),
        send(D, display, text(Auto, center, normal), point(20,52)),
        send(D, display, text('Compañia: ', center, normal), point(200,40)),
        send(D, display, text(Armadora, center, normal), point(270,52)),
        combustion1(Auto1,Combustible),
        compañia(Auto1,Armadora1),
        send(D, display, text(Auto1, center, normal), point(20,64)),
        send(D, display, text(Armadora1, center, normal), point(270,64)),
        combustion2(Auto2,Combustible),
        compañia(Auto2,Armadora2),
        send(D, display, text(Auto2, center, normal), point(20,76)),
        send(D, display, text(Armadora2, center, normal), point(270,76)),
        combustion3(Auto3,Combustible),
        compañia(Auto3,Armadora3),
        send(D, display, text(Auto3, center, normal), point(20,88)),
        send(D, display, text(Armadora3, center, normal), point(270,88)),

        send(Menu,append,new(Iniciar2,popup('Buscar: '))),
               send_list(Iniciar2,append,
                      [menu_item(auto,message(@prolog,ask_name2))
                      ]),


        send(D,open,point(200,200)),
        nl.

        combustion2('195','Gasolina').
        combustion2('A4 B9 AVANT','Diesel').
        combustion1('360 SPYDER','Gasolina').
        combustion1('ALLROAD','Diesel').
        combustion3('A3 CABRIO','Diesel').
        combustion3('MONDIAL','Gasolina').

 pp3(Motor):-
        new(D,dialog(Motor)),
        send(D,size,size(500,300)),
        send(D,colour,colour(black)),
        send(D, append, new(Menu, menu_bar)),
        send(D, display, text(Motor, center, normal), point(100,25)),
        motor(Auto, Motor),
        compañia(Auto, Armadora),
        send(D, display, text('Auto: ', center, normal), point(10,40)),
        send(D, display, text(Auto, center, normal), point(20,52)),
        send(D, display, text('Compañia: ', center, normal), point(200,40)),
        send(D, display, text(Armadora, center, normal), point(270,52)),
        motor1(Auto1,Motor),
        compañia(Auto1,Armadora1),
        send(D, display, text(Auto1, center, normal), point(20,64)),
        send(D, display, text(Armadora1, center, normal), point(270,64)),

        send(Menu,append,new(Iniciar2,popup('Buscar: '))),
               send_list(Iniciar2,append,
                      [menu_item(auto,message(@prolog,ask_name2))
                      ]),
        send(D,open,point(200,200)),
        nl.
        motor1('328 GTB','V8').
        motor1('A3 SEDAN','I4').
        
 pp4(Año):-
        new(D,dialog(Año)),
        send(D,size,size(500,300)),
        send(D,colour,colour(black)),
        send(D, append, new(Menu, menu_bar)),
        send(D, display, text(Año, center, normal), point(100,25)),
        creacion(Auto, Año),
        compañia(Auto, Armadora),
        send(D, display, text('Auto: ', center, normal), point(10,40)),
        send(D, display, text(Auto, center, normal), point(20,52)),
        send(D, display, text('Compañia: ', center, normal), point(200,40)),
        send(D, display, text(Armadora, center, normal), point(270,52)),
        creacion1(Auto1,Año),
        compañia(Auto1,Armadora1),
        send(D, display, text(Auto1, center, normal), point(20,64)),
        send(D, display, text(Armadora1, center, normal), point(270,64)),

        send(Menu,append,new(Iniciar2,popup('Buscar: '))),
               send_list(Iniciar2,append,
                      [menu_item(auto,message(@prolog,ask_name2))
                      ]),
        send(D,open,point(200,200)),
        nl.
        creacion1('F50','1995').
        creacion1('A7 SPORTBACK','2010').

%tipo de compañia

compañia('A1 ATTRACTION','AUDI').
compañia('A1 SPORTBACK','AUDI').
compañia('A1 AMBITION','AUDI').
compañia('A6 C7','AUDI').
compañia('A3 TFSI','AUDI').
compañia('A3 CABRIO','AUDI').
compañia('A3 SEDAN','AUDI').
compañia('ALLROAD','AUDI').
compañia('A3','AUDI').
compañia('A3 CABRIOLET','AUDI').
compañia('A6 AVANT','AUDI').
compañia('A4 B9','AUDI').
compañia('A4 ALLROAD','AUDI').
compañia('A4 B9 AVANT','AUDI').
compañia('A4 RESTYLING','AUDI').
compañia('A5','AUDI').
compañia('A5 COUPE','AUDI').
compañia('A8 D3','AUDI').
compañia('A8 D2','AUDI').
compañia('R8 SPYDER','AUDI').
compañia('A6 C6','AUDI').
compañia('A6 L C6','AUDI').
compañia('A6 C5','AUDI').
compañia('A6 C4','AUDI').
compañia('A7 SPORTBACK','AUDI').
compañia('Q2','AUDI').
compañia('Q5','AUDI').
compañia('TT COUPE','AUDI').
compañia('TT ROADSTER','AUDI').
compañia('TT 8J','AUDI').

compañia('GTC4 LUSSO','FERRARI').
compañia('488 GTB','FERRARI').
compañia('F12 BERLINETTA','FERRARI').
compañia('F12 TRS','FERRARI').
compañia('CALIFORNIA','FERRARI').
compañia('SERGIO','FERRARI').
compañia('458 ITALIA','FERRARI').
compañia('LA FERRARI','FERRARI').
compañia('FF','FERRARI').
compañia('SA APERTA','FERRARI').
compañia('CALIFORNIA','FERRARI').
compañia('599','FERRARI').
compañia('GG50','FERRARI').
compañia('575 SUPER AMERICA','FERRARI').
compañia('F430','FERRARI').
compañia('575M','FERRARI').
compañia('ENZO','FERRARI').
compañia('360 SPYDER','FERRARI').
compañia('360 MODENA','FERRARI').
compañia('550 BARCHETTA','FERRARI').
compañia('F50','FERRARI').
compañia('456','FERRARI').
compañia('512','FERRARI').
compañia('348','FERRARI').
compañia('F40','FERRARI').
compañia('328 GTB','FERRARI').
compañia('412','FERRARI').
compañia('MONDIAL','FERRARI').
compañia('166','FERRARI').
compañia('195','FERRARI').



%Año en el que fue creado
creacion('A1 ATTRACTION','2015').
creacion('A1 SPORTBACK','2014').
creacion('A1 AMBITION','2010').
creacion('A6 C7','2014').
creacion('A3 TFSI','2016').
creacion('A3 CABRIO','2016').
creacion('A3 SEDAN','2016').
creacion('ALLROAD','2014').
creacion('A3','AUDI','2003').
creacion('A3 CABRIOLET','2010').
creacion('A6 AVANT','2000').
creacion('A4 B9','2015').
creacion('A4 ALLROAD','2016').
creacion('A4 B9 AVANT','2016').
creacion('A4 RESTYLING','2012').
creacion('A5','2016').
creacion('A5 COUPE','2007').
creacion('A8 D3','2004').
creacion('A8 D2','1994').
creacion('R8 SPYDER','2016').
creacion('A6 C6','2014').
creacion('A6 L C6','2005').
creacion('A6 C5','1998').
creacion('A6 C4','1995').
creacion('A7 SPORTBACK','2010').
creacion('Q2','2016').
creacion('Q5','2009').
creacion('TT COUPE','2016').
creacion('TT ROADSTER','2015').
creacion('TT 8J','2010').

creacion('GTC4 LUSSO','2016').
creacion('488 GTB','2015').
creacion('F12 BERLINETTA','2015').
creacion('F12 TRS','2014').
creacion('CALIFORNIA','2014').
creacion('SERGIO','2014').
creacion('458 ITALIA','2009').
creacion('LA FERRARI','2013').
creacion('FF','2011').
creacion('SA APERTA','2010').
creacion('CALIFORNIA','2008').
creacion('599','2006').
creacion('GG50','2005').
creacion('575 SUPER AMERICA','2005').
creacion('F430','2004').
creacion('575M','2006').
creacion('ENZO','2002').
creacion('360 SPYDER','2000').
creacion('360 MODENA','1999').
creacion('550 BARCHETTA','2000').
creacion('F50','1995').
creacion('456','1992').
creacion('512','1994').
creacion('348','1993').
creacion('F40','1987').
creacion('328 GTB','1986').
creacion('412','1986').
creacion('MONDIAL','1986').
creacion('166','1953').
creacion('195','1953').



%Tipo de combustible que utiliza

combustion('A1 ATTRACTION','Gasolina').
combustion('A1 SPORTBACK','Gasolina').
combustion('A1 AMBITION','Gasolina').
combustion('A6 C7','Gasolina').
combustion('A3 TFSI','Gasolina').
combustion('A3 CABRIO','Diesel').
combustion('A3 SEDAN','Gasolina').
combustion('ALLROAD','Diesel').
combustion('A3','AUDI','Gasolina').
combustion('A3 CABRIOLET','Gasolina').
combustion('A6 AVANT','Gasolina').
combustion('A4 B9','Gasolina').
combustion('A4 ALLROAD','Gasolina').
combustion('A4 B9 AVANT','Diesel').
combustion('A4 RESTYLING','Gasolina').
combustion('A5','Gasolina').
combustion('A5 COUPE','Gasolina').
combustion('A8 D3','Gasolina').
combustion('A8 D2','Gasolina').
combustion('R8 SPYDER','Gasolina').
combustion('A6 C6','Diesel').
combustion('A6 L C6','Gasolina').
combustion('A6 C5','Gasolina').
combustion('A6 C4','Gasolina').
combustion('A7 SPORTBACK','Gasolina').
combustion('Q2','Gasolina').
combustion('Q5','Diesel').
combustion('TT COUPE','Diesel').
combustion('TT ROADSTER','Diesel').
combustion('TT 8J','Gasolina').

combustion('GTC4 LUSSO','Gasolina').
combustion('488 GTB','Gasolina').
combustion('F12 BERLINETTA','Gasolina').
combustion('F12 TRS','Gasolina').
combustion('CALIFORNIA','Gasolina').
combustion('SERGIO','Gasolina').
combustion('458 ITALIA','Gasolina').
combustion('LA FERRARI','Gasolina').
combustion('FF','Gasolina').
combustion('SA APERTA','Gasolina').
combustion('CALIFORNIA','Gasolina').
combustion('599','Gasolina').
combustion('GG50','Gasolina').
combustion('575 SUPER AMERICA','Gasolina').
combustion('F430','Gasolina').
combustion('575M','Gasolina').
combustion('ENZO','Gasolina').
combustion('360 SPYDER','Gasolina').
combustion('360 MODENA','Gasolina').
combustion('550 BARCHETTA','Gasolina').
combustion('F50','Gasolina').
combustion('456','Gasolina').
combustion('512','Gasolina').
combustion('348','Gasolina').
combustion('F40','Gasolina').
combustion('328 GTB','Gasolina').
combustion('412','Gasolina').
combustion('MONDIAL','Gasolina').
combustion('166','Gasolina').
combustion('195','Gasolina').


%Velocidades que tiene

velocidades('A1 ATTRACTION','6').
velocidades('A1 SPORTBACK','7').
velocidades('A1 AMBITION','5').
velocidades('A6 C7','7').
velocidades('A3 TFSI','6').
velocidades('A3 CABRIO','6').
velocidades('A3 SEDAN','7').
velocidades('ALLROAD','8').
velocidades('A3','AUDI','5').
velocidades('A3 CABRIOLET','6').
velocidades('A6 AVANT','6').
velocidades('A4 B9','6').
velocidades('A4 ALLROAD','7').
velocidades('A4 B9 AVANT','6').
velocidades('A4 RESTYLING','6').
velocidades('A5','6').
velocidades('A5 COUPE','6').
velocidades('A8 D3','1').
velocidades('A8 D2','5').
velocidades('R8 SPYDER','7').
velocidades('A6 C6','6').
velocidades('A6 L C6','6').
velocidades('A6 C5','5').
velocidades('A6 C4','5').
velocidades('A7 SPORTBACK','7').
velocidades('Q2','7').
velocidades('Q5','6').
velocidades('TT COUPE','6').
velocidades('TT ROADSTER','6').
velocidades('TT 8J','6').

velocidades('GTC4 LUSSO','7').
velocidades('488 GTB','7').
velocidades('F12 BERLINETTA','7').
velocidades('F12 TRS','7').
velocidades('CALIFORNIA','7').
velocidades('SERGIO','7').
velocidades('458 ITALIA','7').
velocidades('LA FERRARI','7').
velocidades('FF','7').
velocidades('SA APERTA','6').
velocidades('CALIFORNIA','7').
velocidades('599','6').
velocidades('GG50','6').
velocidades('575 SUPER AMERICA','6').
velocidades('F430','6').
velocidades('575M','6').
velocidades('ENZO','6').
velocidades('360 SPYDER','6').
velocidades('360 MODENA','6').
velocidades('550 BARCHETTA','6').
velocidades('F50','6').
velocidades('456','6').
velocidades('512','5').
velocidades('348','5').
velocidades('F40','5').
velocidades('328 GTB','5').
velocidades('412','5').
velocidades('MONDIAL','5').
velocidades('166','4').
velocidades('195','5').


%Eficiencia

eficiencia('A1 ATTRACTION','B').
eficiencia('A1 SPORTBACK','B').
eficiencia('A1 AMBITION','B').
eficiencia('A6 C7','C').
eficiencia('A3 TFSI','B').
eficiencia('A3 CABRIO','B').
eficiencia('A3 SEDAN','C').
eficiencia('ALLROAD','E').
eficiencia('A3','AUDI','E').
eficiencia('A3 CABRIOLET','C').
eficiencia('A6 AVANT','B').
eficiencia('A4 B9','C').
eficiencia('A4 ALLROAD','D').
eficiencia('A4 B9 AVANT','B').
eficiencia('A4 RESTYLING','D').
eficiencia('A5','C').
eficiencia('A5 COUPE','E').
eficiencia('A8 D3','F').
eficiencia('A8 D2','F').
eficiencia('R8 SPYDER','G').
eficiencia('A6 C6','E').
eficiencia('A6 L C6','B').
eficiencia('A6 C5','F').
eficiencia('A6 C4','F').
eficiencia('A7 SPORTBACK','E').
eficiencia('Q2','C').
eficiencia('Q5','D').
eficiencia('TT COUPE','B').
eficiencia('TT ROADSTER','B').
eficiencia('TT 8J','D').

eficiencia('GTC4 LUSSO','G').
eficiencia('488 GTB','G').
eficiencia('F12 BERLINETTA','G').
eficiencia('F12 TRS','G').
eficiencia('CALIFORNIA','G').
eficiencia('SERGIO','G').
eficiencia('458 ITALIA','G').
eficiencia('LA FERRARI','G').
eficiencia('FF','G').
eficiencia('SA APERTA','G').
eficiencia('CALIFORNIA','G').
eficiencia('599','G').
eficiencia('GG50','-').
eficiencia('575 SUPER AMERICA','G').
eficiencia('F430','G').
eficiencia('575M','-').
eficiencia('ENZO','-').
eficiencia('360 SPYDER','G').
eficiencia('360 MODENA','G').
eficiencia('550 BARCHETTA','-').
eficiencia('F50','B').
eficiencia('456','D').
eficiencia('512','-').
eficiencia('348','-').
eficiencia('F40','-').
eficiencia('328 GTB','-').
eficiencia('412','-').
eficiencia('MONDIAL','-').
eficiencia('166','-').
eficiencia('195','-').



%Velocidad

velocidad('A1 ATTRACTION','204').
velocidad('A1 SPORTBACK','204').
velocidad('A1 AMBITION','180').
velocidad('A6 C7','233').
velocidad('A3 TFSI ','206').
velocidad('A3 CABRIO','200').
velocidad('A3 SEDAN','242').
velocidad('ALLROAD','255').
velocidad('A3','AUDI','185').
velocidad('A3 CABRIOLET','190').
velocidad('A6 AVANT','209').
velocidad('A4 B9','210').
velocidad('A4 ALLROAD','246').
velocidad('A4 B9 AVANT','200').
velocidad('A4 RESTYLING','208').
velocidad('A5','240').
velocidad('A5 COUPE','226').
velocidad('A8 D3','242').
velocidad('A8 D2','228').
velocidad('R8 SPYDER','318').
velocidad('A6 C6','210').
velocidad('A6 L C6','219').
velocidad('A6 C5','220').
velocidad('A6 C4','200').
velocidad('A7 SPORTBACK','235').
velocidad('Q2','190').
velocidad('Q5','192').
velocidad('TT COUPE','241').
velocidad('TT ROADSTER','237').
velocidad('TT 8J','226').

velocidad('GTC4 LUSSO','335').
velocidad('488 GTB','330').
velocidad('F12 BERLINETTA','340').
velocidad('F12 TRS','340').
velocidad('CALIFORNIA','316').
velocidad('SERGIO','-').
velocidad('458 ITALIA','325').
velocidad('LA FERRARI','350').
velocidad('FF','335').
velocidad('SA APERTA','325').
velocidad('CALIFORNIA','310').
velocidad('599','330').
velocidad('GG50','-').
velocidad('575 SUPER AMERICA','325').
velocidad('F430','315').
velocidad('575M','-').
velocidad('ENZO','350').
velocidad('360 SPYDER','290').
velocidad('360 MODENA','295').
velocidad('550 BARCHETTA','300').
velocidad('F50','325').
velocidad('456','300').
velocidad('512','315').
velocidad('348','280').
velocidad('F40','324').
velocidad('328 GTB','263').
velocidad('412','255').
velocidad('MONDIAL','250').
velocidad('166','240').
velocidad('195','230').

%Tipo de motor

motor('A1 ATTRACTION','I4').
motor('A1 SPORTBACK','I4').
motor('A1 AMBITION','I4').
motor('A6 C7','I4').
motor('A3 TFSI','I3').
motor('A3 CABRIO','I4').
motor('A3 SEDAN','I4').
motor('ALLROAD','V6').
motor('A3','I4').
motor('A3 CABRIOLET','I4').
motor('A6 AVANT','I4').
motor('A4 B9','I4').
motor('A4 ALLROAD','I4').
motor('A4 B9 AVANT','I4').
motor('A4 RESTYLING','I4').
motor('A5','I4').
motor('A5 COUPE','I4').
motor('A8 D3','V6').
motor('A8 D2','V6').
motor('R8 SPYDER','V10').
motor('A6 C6','I4').
motor('A6 L C6','I4').
motor('A6 C5','V6').
motor('A6 C4','I4').
motor('A7 SPORTBACK','V6').
motor('Q2','I3').
motor('Q5','I4').
motor('TT COUPE','I4').
motor('TT ROADSTER','I4').
motor('TT 8J','I4').

motor('GTC4 LUSSO','V12').
motor('488 GTB','V8').
motor('F12 BERLINETTA','V12').
motor('F12 TRS','V12').
motor('CALIFORNIA','V8').
motor('SERGIO','V8').
motor('458 ITALIA','V8').
motor('LA FERRARI','V12').
motor('FF','V12').
motor('SA APERTA','V12').
motor('CALIFORNIA','V8').
motor('599','V12').
motor('GG50','V12').
motor('575 SUPER AMERICA','V12').
motor('F430','V8').
motor('575M','V12').
motor('ENZO','V12').
motor('360 SPYDER','V8').
motor('360 MODENA','V8').
motor('550 BARCHETTA','V12').
motor('F50','V12').
motor('456','V12').
motor('512','V12').
motor('348','V8').
motor('F40','V8').
motor('328 GTB','V8').
motor('412','V12').
motor('MONDIAL','V8').
motor('166','V12').
motor('195','V12').



