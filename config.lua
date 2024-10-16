Config = {}

-- Liste von Radiosendern mit ihren Positionen und MP3-Dateien
Config.Radios = {
    {
        name = "Radio 1", 
        coords = vector3(-1230.0187, -1045.1576, 8.2833),  -- Beispielkoordinaten
        radius = 9.0,  -- Spieler muss sich innerhalb eines 30-Meter-Radius befinden
        file = "ODETARI_KEEP_UP.mp3",
        volume = 0.05
    },
    {
        name = "Radio 2", 
        coords = vector3(-1500.0, -3000.0, 15.0),  -- Beispielkoordinaten
        radius = 30.0,  -- Spieler muss sich innerhalb eines 30-Meter-Radius befinden
        file = "radio2.mp3", 
        volume = 0.7
    }
}

-- Maximale Entfernung zum Radio, um die Musik zu hören
Config.MaxDistance = 50.0  -- In Metern