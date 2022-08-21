"""
@author Edoardo Sichelli
This is a python script for a project for my Basi di dati class at UniPr 2021/2022
"""

from time import sleep
from mysql.connector import (connection)
from datetime import date, datetime, timedelta
import string
import random

#connection to db
host = '127.0.0.1'
db = 'Sbet'
user = 'root'
pwd = ''


try:
	conn = connection.MySQLConnection(user=user, password=pwd, host=host, db=db)
	print('Connection established')
except Exception as e:
	print(e, '\nError while connecting to db')

cursor = conn.cursor()

def id_generator(size=16, chars=string.ascii_uppercase + string.ascii_lowercase + string.digits):
	return ''.join(random.choice(chars) for _ in range(size))

def insert_users():
    query = ("insert into user (username, password, money) values (%s, %s, %s)")
    data = ('sichej', '9dd4e461268c8034f5c8564e155c67a6', 100)
    cursor.execute(query, data)
    conn.commit()

def insert_games():
    serieAcalcio = ["Atalanta","Bologna","Cremonese","Empoli","Fiorentina","Inter","Juventus","Lazio","Lecce","Milan","Monza","Napoli","Roma","Salernitana","Sampdoria","Sassuolo","Spezia","Torino","Udinese","Verona"]
    serieAvolley = ["3M PALLAVOLO PERUGIA","ROMA VOLLEY CLUB","SANT'ANNA MESSINA","ANTHEA VICENZA","VOLLEYBALL SANT'ELIA","MILLENIUM BRESCIA","CDA TALMASSONS","CHROMOVIS ABO OFFANENGO","CLUB ITALIA CRAI","EMILBRONZO 2000 MONTALE","GIOVANI BUSTO ARSIZIO","IDEA SASSUOLO","RAMONDA MONTECCHIO","GROUP MARTIGNACCO","ITAS TRENTINO","LPM BAM MONDOVÌ","MT S.GIOV. IN MARIGNANO","LECCO A. PICCO","INTERNATIONAL SOVERATO","SIGEL MARSALA VOLLEY","ALBESE VOLLEY COMO","US ESPERIA CREMONA","VOLLEY HERMAEA OLBIA"]
    basketNba = ["Boston Celtics","Brooklyn Nets","New York Knicks","Philadelphia 76ers","Toronto Raptors","Chicago Bulls","Cleveland Cavaliers","Detroit Pistons","Indiana Pacers","Milwaukee Bucks"]
    #calcio
    i = 0
    while (i != 8):
        sport = 'calcio'
        id_game = id_generator()
        team1 = random.choice(serieAcalcio)
        serieAcalcio.remove(team1)
        team2 = random.choice(serieAcalcio)
        serieAcalcio.remove(team2)
        query = ("insert into game (sport, team1, team2, id_game) values (%s, %s, %s, %s)")
        data = (sport, team1, team2, id_game)
        cursor.execute(query, data)
        conn.commit()
        id_quote = id_generator()
        query = ("insert into quote (id_quote, one, x, two, id_game) values (%s, %s, %s, %s, %s)")
        one = round(random.uniform(1,2), 2)
        x = round(random.uniform(2,3), 2)
        two = round(random.uniform(1,2), 2)
        data = (id_quote, one, x, two, id_game)
        cursor.execute(query, data)
        conn.commit()
        print(data)
        i += 1

    i = 0
    while (i != 8):
        sport = 'volleyball'
        id_game = id_generator()
        team1 = random.choice(serieAvolley)
        serieAvolley.remove(team1)
        team2 = random.choice(serieAvolley)
        serieAvolley.remove(team2)
        query = ("insert into game (sport, team1, team2, id_game) values (%s, %s, %s, %s)")
        data = (sport, team1, team2, id_game)
        cursor.execute(query, data)
        conn.commit()
        id_quote = id_generator()
        query = ("insert into quote (id_quote, one, two, id_game) values (%s, %s, %s, %s)")
        one = round(random.uniform(1,2), 2)
        two = round(random.uniform(1,2), 2)
        data = (id_quote, one, two, id_game)
        cursor.execute(query, data)
        conn.commit()
        print(data)
        i += 1
    #nba
    i = 0
    while (i != 4):
        sport = 'basket'
        id_game = id_generator()
        team1 = random.choice(basketNba)
        basketNba.remove(team1)
        team2 = random.choice(basketNba)
        basketNba.remove(team2)
        query = ("insert into game (sport, team1, team2, id_game) values (%s, %s, %s, %s)")
        data = (sport, team1, team2, id_game)
        cursor.execute(query, data)
        conn.commit()
        id_quote = id_generator()
        query = ("insert into quote (id_quote, one, two, id_game) values (%s, %s, %s, %s)")
        one = round(random.uniform(1,2), 2)
        two = round(random.uniform(1,2), 2)
        data = (id_quote, one, two, id_game)
        cursor.execute(query, data)
        conn.commit()
        print(data)
        i += 1
#insert_games()
#insert_users()







# def id_generator(size=16, chars=string.ascii_uppercase + string.digits):
# 	return ''.join(random.choice(chars) for _ in range(size))

# def cc_generator(size=16, chars=string.digits):
# 	return ''.join(random.choice(chars) for _ in range(size))

# def cvv_generator(size=3, chars=string.digits):
# 	return ''.join(random.choice(chars) for _ in range(size))

# def iban_generator(size=30, chars=string.ascii_uppercase + string.digits):
# 	return ''.join(random.choice(chars) for _ in range(size))

# def insertUsers():
# 	with open('wordlist_name.txt') as f:
# 		lines = f.readlines()
# 	names = []
# 	for ele in lines:
# 		names.append(ele.strip())
# 	with open('wordlist_surname.txt') as f:
# 		lines = f.readlines()
# 	surnames = []
# 	for ele in lines:
# 		surnames.append(ele.strip())
# 	with open('wordlist_username.txt') as f:
# 		lines = f.readlines()
# 	usernames = []
# 	for ele in lines:
# 		usernames.append(ele.strip())
	
# 	query = ("INSERT INTO user (username, name, surname, address, fiscal_code, user_type, password) VALUES (%s, %s, %s, %s, %s, %s, %s)")

# 	v = ['via Toscana ','via Garibaldi ','via Langhirano ']
# 	i = 0
# 	j = 0
# 	while i < 32:
# 		f_code = id_generator()
# 		if j == len(v)-1:
# 			j = 0
# 		data = (usernames[i], names[i], surnames[i], v[j]+str(i), f_code, 'memeber', '9dd4e461268c8034f5c8564e155c67a6')
# 		cursor.execute(query, data)
# 		conn.commit()
# 		i += 1
# 		j += 1


# def insertBoats():
# 	with open('wordlist_boat.txt') as f:
# 		lines = f.readlines()
# 	boats = []
# 	for ele in lines:
# 		boats.append(ele.strip())
# 	query = ("SELECT username FROM user ")
# 	cursor.execute(query)
# 	usernames = []
# 	for i in cursor:
# 		usernames.append(str(i[0]))
	
# 	query = ("INSERT INTO boat (id, name, length, id_member, picture) VALUES (%s, %s, %s, %s, %s)")
# 	i = 0
# 	j = 0
# 	while i < 40:#len(boats):
# 		r = random.randint(8, 70)
# 		if j == len(usernames)-1:
# 			j = 0
# 		data = (0, boats[i], r, usernames[j], "generic.jpg")
# 		cursor.execute(query, data)
# 		conn.commit()
# 		i += 1
# 		j += 1

# def insertCreditCards():
# 	query = ("SELECT username FROM user ")
# 	cursor.execute(query)
# 	usernames = []
# 	for i in cursor:
# 		usernames.append(str(i[0]))
	
# 	query = ("INSERT INTO credit_card (card_number, cvv, expiration_date, id_member) VALUES (%s, %s, %s, %s)")
# 	#b = ['Intesa San Paolo','Credit Agricol','Unicredit', 'Mediolanum']
# 	i = 0
# 	while i < len(usernames):
# 		credit_card = cc_generator()
# 		if credit_card[0] == 0:
# 			credit_card = cc_generator()
# 		cvv = cvv_generator()
# 		if int(cvv) < 100:
# 			cvv = cvv_generator()
# 		int(cvv)
# 		data = (credit_card, cvv, date(random.randint(2022, 2030),random.randint(1, 12), random.randint(1, 30)), usernames[i])
# 		cursor.execute(query, data)
# 		conn.commit()
# 		i += 1

# def insertRaces():
# 	query = ("INSERT INTO race (id, date, price) VALUES (%s, %s, %s)")
# 	i = 0
# 	while i < 25:
# 		data = (0, date(random.randint(2022, 2025), random.randint(5, 9), random.randint(1, 30)), random.randint(300, 700))
# 		cursor.execute(query, data)
# 		conn.commit()
# 		i += 1

# def insertMembershipFees():
# 	query = ("SELECT username FROM user ")
# 	cursor.execute(query)
# 	usernames = []
# 	for i in cursor:
# 		usernames.append(str(i[0]))

# 	query = ("INSERT INTO membership_fee (id, payment_date, expiration_date, price, id_member) VALUES (%s, %s, %s, %s, %s)")
# 	i = 0
# 	while i < len(usernames):
# 		pd = date(random.randint(2020, 2021), random.randint(1, 12), random.randint(1, 30))
# 		ed = pd + timedelta(days=365)
# 		price = 500
# 		data = (0, pd, ed, price , usernames[i])
# 		cursor.execute(query, data)
# 		conn.commit()
# 		i += 1

# def insertBoatStorageFees():
# 	query = ("SELECT id, length FROM boat ")
# 	cursor.execute(query)
# 	boats = []
# 	for i in cursor:
# 		boats.append(i)
	
# 	query = ("INSERT INTO boat_storage_fee (id, payment_date, expiration_date, amount, id_boat) VALUES (%s, %s, %s, %s, %s)")
# 	i = 0
# 	while i < len(boats):
# 		pd = date(random.randint(2020, 2021), random.randint(1, 12), random.randint(1, 30))
# 		ed = pd + timedelta(days=365)
# 		amount = int(boats[i][1]) * 12
# 		data = (0, pd, ed, amount, int(boats[i][0]))
# 		cursor.execute(query, data)
# 		conn.commit()
# 		i += 1

	
# def insertRaceParticipations():
# 	query = ("SELECT id FROM race ")
# 	cursor.execute(query)
# 	racesId = []
# 	for i in cursor:
# 		racesId.append(i)
# 	query = ("SELECT username FROM user ")
# 	cursor.execute(query)
# 	usernames = []
# 	for i in cursor:
# 		usernames.append(str(i))
# 	print('Number of members: ', len(usernames))
# 	n = input('How many races for memer? ')
# 	if int(n) < 1 or int(n) > len(racesId):
# 		return
# 	else:
# 		i = 0
# 		j = 0
# 		query = ("INSERT INTO race_participation (id_member, id_race) VALUES (%s, %s)")
# 		while i < len(usernames):
# 			while j < int(n):
# 				k = random.randint(1, len(racesId))
# 				data = (usernames[i], k)
# 				#data = ('Alexander', k)
# 				#cursor.execute(query, data)
# 				#conn.commit()
# 				#print(usernames[i], k)
# 				j += 1
# 			j = 0
# 			i += 1
	
		
	



# def main():
# 	print('1) INSERT users')
# 	print('2) INSERT boats')
# 	print('3) INSERT credit cards')
# 	print('4) INSERT races')
# 	print('5) INSERT membership fees')
# 	print('6) INSERT boat storage fees')
# 	print('7) INSERT race partecipation')
	
# 	c = input('Choose: ')

# 	if c == '1':
# 		insertUsers()
# 	elif c == '2':
# 		insertBoats()
# 	elif c == '3':
# 		insertCreditCards()
# 	elif c == '4':
# 		insertRaces()
# 	elif c == '5':
# 		insertMembershipFees()
# 	elif c == '6':
# 		insertBoatStorageFees()
# 	elif c == '7':
# 		insertRaceParticipations()


# 	cursor.close()
# 	conn.close()

# main()