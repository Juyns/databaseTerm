# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

from flask import Flask, render_template, request
import psycopg2
connect = psycopg2.connect("dbname=athlentic user=postgres password=qlalfqjsgh^^7")
cur = connect.cursor()

app = Flask(__name__)
@app.route('/')
def firstPage(): #라우팅하고 바로 실행하게 됨
    # Use a breakpoint in the code line below to debug your script.
    return render_template('main.html')

@app.route('/stat', methods=['GET'])
def print_stats():
    cur.execute("select player.name, ROUND(avg(record.ppg), 1) as points_per_game, ROUND(avg(record.apg), 1) as assists_per_game, ROUND(avg(record.rpg), 1) as rebounds_per_game from player, playin natural join record where player.id=playin.player_id group by player.name;")
    result = cur.fetchall()
    return render_template('stat.html', infos=result)

@app.route('/team_player', methods=['POST'])
def print_players():
    year = request.form["year"]
    button = request.form["send"]
    if button:
        cur.execute("SELECT T.name, P.id, P.name from team as T, player as P where P.id in (select player_id from playin where T.id=team_id and year={})".format(int(year)))
        result = cur.fetchall()
        if result: return render_template('print.html', rosters=result)
    return render_template('failed.html')



@app.route('/add_myplayer', methods=['POST'])
def add_bookmark():
    playerid = request.form["player"]
    mytag = request.form["mytag"]
    send = request.form["send"]
    if send:
        message="my bookmark"
        if send == "add to bookmark":
            cur.execute("INSERT INTO bookmark VALUES('{}', '{}');".format(playerid, mytag))
            connect.commit()
            message="player inserted"
        if send == "delete from bookmark":
            if playerid:
                cur.execute("DELETE FROM bookmark WHERE player_id='{}';".format(playerid))
                connect.commit()
                message="player deleted"
            else: message="no info to delete"
        cur.execute("select player_id, name, mytag from bookmark as B, player as P where B.player_id = P.id;")
        result = cur.fetchall()
        if result: return render_template('mybookmark.html', sorf=message, bookmark=result)
    return render_template('mybookmark.html', sorf="something excepted")

@app.route('/editTag', methods=['POST'])
def edit_tag():
    id = request.form["id"]
    newtag = request.form["newtag"]
    send = request.form["edit"]
    if send:
        cur.execute("update bookmark set mytag='{}' where player_id='{}';".format(newtag, id))
        connect.commit()
    return firstPage()


if __name__ == '__main__':
    app.run()

