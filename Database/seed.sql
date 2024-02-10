USE leave;

DELETE FROM Workouts;
DELETE FROM UserExercises;
DELETE FROM Exercises;
DELETE FROM Users;

INSERT INTO Users (UserName, Email, PasswordHash, DateOfBirth, Gender, Height, Weight)
VALUES ('Steyer Mika', 'mikasteyer9@gmail.com', 'AdminAdmin1!', '2005-05-11', 'Männlich', 1.85, 65);

INSERT INTO Exercises (ExerciseName, Description)
VALUES 
    ('Liegestütze', 'Eine häufige Körpergewichtsübung, bei der eine Person ihren Körper mit den Armen hebt und senkt.'),
    ('Kniebeugen', 'Eine Übung für die untere Körperhälfte, bei der eine Person ihre Hüften aus einer stehenden Position senkt und dann wieder aufrichtet.'),
    ('Klimmzüge', 'Eine Übung für die obere Körperhälfte, bei der eine Person an einer Stange hängt und sich hochzieht, bis das Kinn über der Stange ist.'),
    ('Bankdrücken', 'Eine Krafttrainingsübung, bei der eine Person auf dem Rücken auf einer Bank liegt und eine Langhantel zur Brust senkt/erhöht.'),
    ('Kreuzheben', 'Eine Krafttrainingsübung, bei der eine Person eine geladene Langhantel vom Boden auf Hüfthöhe hebt und dann wieder senkt.'),
    ('Ausfallschritte', 'Eine Übung für die untere Körperhälfte, bei der eine Person mit einem Bein nach vorne tritt und ihre Hüften senkt, bis beide Knie ungefähr im rechten Winkel gebeugt sind.'),
    ('Plank', 'Eine Kernkraftübung, bei der eine Person eine Position ähnlich wie bei Liegestützen für eine längere Zeit hält.'),
    ('Bizepscurls', 'Eine Isolationsübung, die die Bizepsmuskulatur anspricht, bei der eine Person ein Gewicht zum Schultergelenk beugt.'),
    ('Trizepsdips', 'Eine Übung, die die Trizepsmuskulatur anspricht, bei der eine Person ihren Körper absenkt und wieder anhebt, indem sie ihre Arme an den Ellenbogen beugt und streckt.'),
    ('Bauchmuskeln', 'Eine Bauchübung, bei der eine Person auf dem Rücken liegt, die Schultern vom Boden abhebt und die Bauchmuskeln anspannt.'),
    ('Beinpresse', 'Eine Übung für die untere Körperhälfte, bei der eine Person eine gewichtete Plattform von sich wegstößt, indem sie ihre Beine benutzt, während sie sitzt.'),
    ('Schulterpresse', 'Eine Krafttrainingsübung, bei der eine Person ein Gewicht von der Schulterhöhe bis zu vollständig gestreckten Armen drückt.'),
    ('Russischer Twist', 'Eine Kernübung, bei der eine Person auf dem Boden sitzt, sich leicht nach hinten lehnt und ihren Oberkörper von Seite zu Seite dreht.'),
    ('Wadenheben', 'Eine Übung, die die Wadenmuskulatur anspricht, bei der eine Person ihre Fersen vom Boden hebt, indem sie ihre Knöchel streckt.'),
    ('Hammercurls', 'Eine Variante des Bizepscurls, bei der eine Person die Kurzhanteln mit einem neutralen Griff (Handflächen zueinander) hält und sie beugt.'),
    ('Beinbeugen', 'Eine Krafttrainingsübung, bei der eine Person ein Gewicht zur Gesäßmuskulatur beugt, indem sie ihre Knie beugt.'),
    ('Schrägbankdrücken', 'Ähnlich wie das Bankdrücken, jedoch auf einer schrägen Bank ausgeführt, um die oberen Brustmuskeln stärker anzusprechen.'),
    ('Fliegende Kurzhanteln', 'Eine Krafttrainingsübung, bei der eine Person auf einer Bank liegt und ihre Arme seitlich ausstreckt, dann vor der Brust zusammenführt.'),
    ('Umgekehrte Bauchmuskeln', 'Eine Variation des Crunchs, bei der eine Person die Hüften vom Boden hebt und die Knie zur Brust bringt.'),
    ('Sitzende Rudermaschine', 'Eine Krafttrainingsübung, bei der eine Person sitzt und einen Griff an einer Seilzugmaschine zum Körper zieht.'),
    ('Langhantelrudern', 'Eine Krafttrainingsübung, bei der eine Person sich an der Hüfte beugt, den Rücken gerade hält und eine Langhantel zum unteren Brustbereich zieht.'),
    ('Seitliche Planke', 'Ähnlich wie die Planke, jedoch auf einer Seite ausgeführt, um die seitlichen Bauchmuskeln stärker zu aktivieren.'),
    ('Beinstrecken', 'Eine Krafttrainingsübung, bei der eine Person ihre Knie gegen Widerstand streckt, um die Quadrizepsmuskulatur zu trainieren.'),
    ('Hüftheben', 'Eine Übung für die untere Körperhälfte, bei der eine Person auf dem Boden sitzt, ihren oberen Rücken gegen eine Bank lehnt und dann ihre Hüften nach oben drückt.'),
    ('Mountain Climbers', 'Eine dynamische Übung, bei der eine Person in einer Liegestützposition beginnt und abwechselnd ihre Knie in Richtung Brust bewegt.'),
    ('Kettlebell-Schwung', 'Eine dynamische Übung, bei der eine Person eine Kettlebell zwischen ihren Beinen schwingt und dann ihre Hüften kräftig nach vorne drückt, um sie auf Schulterhöhe zu schwingen.'),
    ('Burpees', 'Eine Ganzkörperübung, bei der eine Person in einer stehenden Position beginnt, sich in eine Kniebeugenposition begibt, ihre Füße in eine Liegestützposition kickt, eine Liegestütz ausführt, zur Kniebeugenposition zurückkehrt und dann hochspringt.'),
    ('Boxsprünge', 'Eine plyometrische Übung, bei der eine Person auf und von einer erhöhten Plattform (Box) springt, um sich auf explosive Beinkraft zu konzentrieren.');

INSERT INTO UserExercises (ExerciseID, WorkoutID, Amount, Notes)
VALUES 
    (1, 1, 45, '3 Sätze mit je 15 Wiederholungen durchgeführt'),
    (2, 1, 48, '4 Sätze mit je 12 Wiederholungen mit Hanteln durchgeführt'),
    (3, 1, 0, 'Unterstützt mit Widerstandsbändern'),
    (10, 2, 60, '3 Sätze mit je 20 Wiederholungen'),
    (12, 2, 50, 'Moderates Gewicht verwendet'),
    (21, 3, 30, 'Fokus auf korrekte Ausführung und kontrollierte Bewegung'),
    (22, 3, 40, 'Schwereres Gewicht für das Krafttraining verwendet'),
    (29, 4, 60, 'Intervalltraining mit hoher Intensität'),
    (30, 4, 20, 'Kettlebell mit korrekter Technik verwendet');


-- Inserting sample workout data for the user
INSERT INTO Workouts (UserID, WorkoutDate, DurationMinutes, CaloriesBurned, Notes)
VALUES 
    (1, '2024-02-10', 60, 300, 'Kardio- und Krafttrainingseinheit'),
    (1, '2024-02-08', 45, 250, 'Training für den oberen Körper'),
    (1, '2024-02-06', 30, 200, 'Beintraining'),
    (1, '2024-02-04', 40, 220, 'Core-Training');