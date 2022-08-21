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