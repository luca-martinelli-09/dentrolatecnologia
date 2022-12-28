/* Informazioni generali */

CREATE TABLE IF NOT EXISTS Impostazioni (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  Titolo VARCHAR(700) NOT NULL,
  Descrizione LONGTEXT NOT NULL,
  DescrizioneBreve VARCHAR(1000) NOT NULL,
  Autore VARCHAR(300) NOT NULL,
  Email VARCHAR(300) NOT NULL,
  Website VARCHAR(500) NOT NULL,
  Lingua VARCHAR(20) NOT NULL,
  Copyright LONGTEXT NOT NULL,
  TagsPodcast LONGTEXT NOT NULL,
  TagsPuntate LONGTEXT NOT NULL,
  ITunesExplicit VARCHAR(20) NOT NULL,
  GPlayExplicit VARCHAR(20) NOT NULL,
  Categoria VARCHAR(70) NOT NULL,
  SottoCategoria VARCHAR(70) DEFAULT NULL,
  Categoria2 VARCHAR(70) NOT NULL,
  SottoCategoria2 VARCHAR(70) DEFAULT NULL,
  NumRiproduzioni INT NOT NULL,
  LastNotificationsSend DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  LastSitemapUpdate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ContentsVersion INT NOT NULL,
  
  PRIMARY KEY (ID)
);

INSERT INTO Impostazioni (Titolo, Descrizione, DescrizioneBreve, Autore, Email, Website, Lingua, Copyright, TagsPodcast, TagsPuntate, ITunesExplicit, GPlayExplicit, Categoria, SottoCategoria, Categoria2, SottoCategoria2, NumRiproduzioni, ContentsVersion) VALUES
  (
    'INSiDER - Dentro la Tecnologia',
    'La nostra prospettiva sul mondo della tecnologia del ventunesimo secolo. Il focus è quello dell’esperienza utente, cioè il rapporto Uomo-Macchina.\n[www.dentrolatecnologia.it](https://www.dentrolatecnologia.it)\nPodcast realizzato da Digital People di Davide Fasoli, Matteo Gallo, Luca Martinelli.\nOgni sabato mattina un nuovo episodio.',
    'La nostra prospettiva sul mondo della tecnologia del ventunesimo secolo. Il focus è quello dell’esperienza utente, cioè il rapporto Uomo-Macchina',
    'Digital People',
    'redazione@dentrolatecnologia.it',
    'https://www.dentrolatecnologia.it',
    'it',
    'Creative Commons Attribuzione - Non opere derivate 4.0 Internazionale',
    'tecnology,tecnologia,news,blog,insider,tech',
    'davide,fasoli,matteo,gallo,martinelli,luca,sites,profile,podcast,tecnology,tecnologia,news,blog,spotify,insider,tech',
    'clean',
    'no',
    'Technology',
    NULL,
    'News',
    'Tech News',
    '8576',
    '17'
  );

CREATE TABLE IF NOT EXISTS TipiContatto (
  CodTipoContatto VARCHAR(100) NOT NULL,
  NomeTipoContatto VARCHAR(300) NOT NULL,

  PRIMARY KEY (CodTipoContatto)
);

INSERT INTO TipiContatto (CodTipoContatto, NomeTipoContatto) VALUES
  ('email', 'Email'),
  ('website', 'Sito web'),
  ('telegram', 'Telegram'),
  ('instagram', 'Instagram'),
  ('twitter', 'Twitter'),
  ('facebook', 'Facebook'),
  ('linkedin', 'Linkedin');

CREATE TABLE IF NOT EXISTS Contatti (
  IDContatto INT AUTO_INCREMENT NOT NULL,
  Nome VARCHAR(300) NOT NULL,
  Link VARCHAR(1000) NOT NULL,
  TestoAlternativo VARCHAR(300),
  CodTipoContatto VARCHAR(100) NOT NULL,
  MostraDescrizione INT(1) NOT NULL DEFAULT 1,
  MostraHomepage INT(1) NOT NULL DEFAULT 1,
  Ordine INT NOT NULL DEFAULT 0,

  PRIMARY KEY (IDContatto),
  FOREIGN KEY (CodTipoContatto) REFERENCES TipiContatto(CodTipoContatto) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Contatti (Nome, Link, TestoAlternativo, CodTipoContatto, MostraDescrizione, MostraHomepage, Ordine) VALUES
  ('Sito web', 'https://www.dentrolatecnologia.it', 'www.dentrolatecnologia.it', 'website', 0, 0, 0),
  ('Instagram', 'https://instagram.com/dentrolatecnologia', 'Instagram (@dentrolatecnologia)', 'instagram', 1, 1, 1),
  ('Telegram', 'https://t.me/dentrolatecnologia', 'Telegram (@dentrolatecnologia)', 'telegram', 1, 1, 2),
  ('Twitter', 'https://twitter.com/insiderdlt', 'Twitter (@insiderdlt)', 'twitter', 0, 1, 3),
  ('Email (Redazione)', 'mailto:redazione@dentrolatecnologia.it', 'redazione@dentrolatecnologia.it', 'email', 1, 1, 4),
  ('Facebook', 'https://www.facebook.com/dentrolatecnologia', 'Facebook (@dentrolatecnologia)', 'facebook', 0, 0, 5);

CREATE TABLE IF NOT EXISTS TipiPiattaforma (
  CodTipoPiattaforma VARCHAR(100) NOT NULL,
  NomePiattaforma VARCHAR(300) NOT NULL,

  PRIMARY KEY (CodTipoPiattaforma)
);

INSERT INTO TipiPiattaforma (CodTipoPiattaforma, NomePiattaforma) VALUES
  ('spotify', 'Spotify'),
  ('applepodcast', 'Apple Podcast'),
  ('googlepodcast', 'Google Podcast'),
  ('amazonmusic', 'Amazon Music'),
  ('youtube', 'YouTube'),
  ('spreaker', 'Spreaker');

CREATE TABLE IF NOT EXISTS LinksPodcast (
  Link VARCHAR(1000) NOT NULL,
  CodTipoPiattaforma VARCHAR(100) NOT NULL,
  Ordine INT NOT NULL DEFAULT 0,
  MostraHomepage INT(1) NOT NULL DEFAULT 1,

  PRIMARY KEY (CodTipoPiattaforma),
  FOREIGN KEY (CodTipoPiattaforma) REFERENCES TipiPiattaforma(CodTipoPiattaforma) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO LinksPodcast (Link, CodTipoPiattaforma, Ordine, MostraHomepage) VALUES
  ('https://open.spotify.com/show/6XkOjGpx6SP32cTeLYxI35', 'spotify', 0, 1),
  ('https://podcasts.apple.com/it/podcast/insider-dentro-la-tecnologia/id1492761030', 'applepodcast', 1, 1),
  ('https://podcasts.google.com/?feed=aHR0cHM6Ly93d3cuZGVudHJvbGF0ZWNub2xvZ2lhLml0L3Jzcw%3D%3D', 'googlepodcast', 2, 1),
  ('https://music.amazon.it/podcasts/8e710ac0-36ad-412f-9942-12e2cfc256df/insider---dentro-la-tecnologia', 'amazonmusic', 3, 1),
  ('https://www.youtube.com/channel/UCZIZ6SBbZp_RLzqKxEXdd8w', 'youtube', 4, 1),
  ('https://www.spreaker.com/show/insider-dentrolatecnologia', 'spreaker', 5, 0);

/* Gestione */

CREATE TABLE IF NOT EXISTS Amministratori (
  IDAmministratore INT AUTO_INCREMENT NOT NULL,
  Nome VARCHAR(300) NOT NULL,
  Cognome VARCHAR(300) NOT NULL,
  Email VARCHAR(300) NOT NULL,
  Password VARCHAR(35) NOT NULL,
  
  PRIMARY KEY (IDAmministratore)
);

CREATE TABLE IF NOT EXISTS LogModifiche (
  IDModifica INT AUTO_INCREMENT NOT NULL,
  IDAmministratore INT,
  DettagliModifica VARCHAR(1000) NOT NULL,
  OrarioModifica DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (IDModifica),
  FOREIGN KEY (IDAmministratore) REFERENCES Amministratori(IDAmministratore) ON DELETE SET NULL ON UPDATE CASCADE
);

/* Anagrafe */

CREATE TABLE IF NOT EXISTS TipiPersona (
  CodTipoPersona VARCHAR(100) NOT NULL,
  NomeTipoPersona VARCHAR(300) NOT NULL,
  RuoloPersona VARCHAR(300) NOT NULL,
  Priorita INT(10) NOT NULL DEFAULT 0,
  NascondiTitolo INT(1) NOT NULL DEFAULT 0,
  
  PRIMARY KEY (CodTipoPersona)
);

INSERT INTO TipiPersona (CodTipoPersona, NomeTipoPersona, RuoloPersona, Priorita, NascondiTitolo) VALUES
  ('autori', 'Redazione', 'Autore', 0, 0),
  ('aziende', 'Aziende', 'Azienda', 4, 0),
  ('collaboratori', 'Collaboratori', 'Collaboratore', 1, 1),
  ('ospiti', 'Ospiti', 'Ospite', 2, 0),
  ('ospiti-amici', 'Ospiti', 'Ospite', 3, 1);

CREATE TABLE IF NOT EXISTS Persone (
  IDPersona VARCHAR(100) NOT NULL,
  Nome VARCHAR(300) NOT NULL,
  Cognome VARCHAR(300),
  Biografia VARCHAR(1000),
  RuoloPersona VARCHAR(300),
  CodTipoPersona VARCHAR(100) NOT NULL,

  PRIMARY KEY (IDPersona),
  FOREIGN KEY (CodTipoPersona) REFERENCES TipiPersona(CodTipoPersona) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ContattiPersone (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  IDPersona VARCHAR(100) NOT NULL,
  Nome VARCHAR(300) NOT NULL,
  Link VARCHAR(700) NOT NULL,
  CodTipoContatto VARCHAR(100) NOT NULL,
  
  PRIMARY KEY (ID),
  FOREIGN KEY (IDPersona) REFERENCES Persone(IDPersona) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (CodTipoContatto) REFERENCES TipiContatto(CodTipoContatto) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS PersoneCorrelate (
  IDPersona VARCHAR(100) NOT NULL,
  IDPersonaCorrelata VARCHAR(100) NOT NULL,
  
  PRIMARY KEY (IDPersona, IDPersonaCorrelata),
  FOREIGN KEY (IDPersona) REFERENCES Persone(IDPersona) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (IDPersonaCorrelata) REFERENCES Persone(IDPersona) ON DELETE CASCADE ON UPDATE CASCADE
);

/* Registrazioni */

CREATE TABLE IF NOT EXISTS AccessiRegistrazioni (
  IDRegistrazione INT AUTO_INCREMENT NOT NULL,
  Password VARCHAR(35) NOT NULL,
  IDOspite VARCHAR(100) DEFAULT NULL,
  DataInizio DATETIME NOT NULL,
  DataFine DATETIME NOT NULL,
  
  PRIMARY KEY (IDRegistrazione),
  FOREIGN KEY (IDOspite) REFERENCES Persone(IDPersona) ON DELETE SET NULL ON UPDATE CASCADE
);

/* Puntate */

CREATE TABLE IF NOT EXISTS Episodi (
  Stagione INT NOT NULL,
  Episodio INT NOT NULL,
  Titolo VARCHAR(255) NOT NULL,
  Descrizione VARCHAR(2000) NOT NULL,
  Tags VARCHAR(700) DEFAULT NULL,
  AudioDuration INT(30) NOT NULL DEFAULT 0,
  AudioSize INT(30) NOT NULL DEFAULT 0,
  DataPubblicazione DATETIME NOT NULL,
  Replica INT(1) NOT NULL DEFAULT 0,
  
  PRIMARY KEY (Stagione, Episodio)
);

CREATE TABLE IF NOT EXISTS TokenAccesso (
  TokenAccesso VARCHAR(36) NOT NULL,
  Stagione INT NOT NULL,
  Episodio INT NOT NULL,
  DataScadenza DATETIME DEFAULT NULL,
  
  PRIMARY KEY (TokenAccesso),
  FOREIGN KEY (Stagione, Episodio) REFERENCES Episodi(Stagione, Episodio) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS LinkEpisodi (
  Stagione INT NOT NULL,
  Episodio INT NOT NULL,
  CodTipoPiattaforma VARCHAR(100) NOT NULL,
  Link VARCHAR(700) NOT NULL,
  
  PRIMARY KEY (Stagione, Episodio, CodTipoPiattaforma),
  FOREIGN KEY (Stagione, Episodio) REFERENCES Episodi(Stagione, Episodio) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (CodTipoPiattaforma) REFERENCES TipiPiattaforma(CodTipoPiattaforma) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS TipiCrediti (
  CodTipoCredito VARCHAR(100) NOT NULL,
  NomeTipoCredito VARCHAR(300) NOT NULL,
  OrdineCredito INT NOT NULL DEFAULT 0,
  
  PRIMARY KEY (CodTipoCredito)
);

INSERT INTO TipiCrediti (CodTipoCredito, NomeCredito, OrdineCredito) VALUES
  ('brani', 'Brani', 0),
  ('immagini', 'Immagini', 1);

CREATE TABLE IF NOT EXISTS Crediti (
  IDCredito INT NOT NULL AUTO_INCREMENT,
  Stagione INT NOT NULL,
  Episodio INT NOT NULL,
  CodTipoCredito VARCHAR(200) DEFAULT 'brani',
  OrdineCredito INT(3) NOT NULL DEFAULT 0,
  
  PRIMARY KEY (IDCredito),
  FOREIGN KEY (Stagione, Episodio) REFERENCES Episodi(Stagione, Episodio) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (CodTipoCredito) REFERENCES TipiCrediti(CodTipoCredito) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Repliche (
  Stagione INT NOT NULL,
  Episodio INT NOT NULL,
  StagioneReplica INT NOT NULL,
  EpisodioReplica INT NOT NULL,
  
  PRIMARY KEY (Stagione, Episodio),
  FOREIGN KEY (Stagione, Episodio) REFERENCES Episodi(Stagione, Episodio) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (StagioneReplica, EpisodioReplica) REFERENCES Episodi(Stagione, Episodio) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Argomenti (
  CodArgomento VARCHAR(100) NOT NULL,
  NomeArgomento VARCHAR(300) NOT NULL,
  ColoreSfondo VARCHAR(100) DEFAULT '#ffffff',
  ColoreTesto VARCHAR(100) DEFAULT '#000000',
  
  PRIMARY KEY (CodArgomento)
);

INSERT INTO Argomenti (CodArgomento, NomeArgomento, ColoreSfondo, ColoreTesto) VALUES
  ('alimentazione', 'Alimentazione', '#52de97', '#000000'),
  ('ambiente', 'Ambiente', '#a7e9af', '#000000'),
  ('applicazioni', 'Applicazioni', '#4dd599', '#000000'),
  ('arte-cultura', 'Arte & Cultura', '#ffffff', '#000000'),
  ('assistenti', 'Assistenti virtuali', '#ffac8e', '#000000'),
  ('automobili', 'Automobili', '#eb4559', '#ffffff'),
  ('batterie', 'Batterie', '#f4e04d', '#000000'),
  ('blockchain', 'Blockchain', '#f7ea00', '#000000'),
  ('cinema', 'Cinema', '#00818a', '#ffffff'),
  ('computer', 'Computer', '#745c97', '#ffffff'),
  ('cuffie', 'Cuffie', '#f7be16', '#000000'),
  ('diritto', 'Diritto', '#f5dea3', '#000000'),
  ('domotica', 'Domotica', '#723881', '#ffffff'),
  ('energia', 'Energia', '#f1fa3c', '#000000'),
  ('finanza', 'Finanza', '#d4d7dd', '#000000'),
  ('fitness', 'Fitness', '#6fb98f', '#ffffff'),
  ('gaming', 'Gaming', '#c70039', '#ffffff'),
  ('giornalismo', 'Giornalismo', '#ffffff', '#000000'),
  ('ia', 'Intelligenza Artificiale', '#342ead', '#ffffff'),
  ('innovazione', 'Innovazione', '#ff8ba7', '#000000'),
  ('internet', 'Internet', '#3fc5f0', '#000000'),
  ('istruzione', 'Istruzione', '#f08a5d', '#000000'),
  ('materiali', 'Materiali', '#ecce6d', '#000000'),
  ('medicina', 'Medicina', '#b2ebf2', '#000000'),
  ('musica', 'Musica', '#f4efd3', '#000000'),
  ('privacy', 'Privacy', '#ffffff', '#000000'),
  ('retemobile', 'Rete Mobile', '#ffffff', '#000000'),
  ('servizi', 'Servizi', '#ffdbc5', '#000000'),
  ('sicurezza', 'Sicurezza', '#1089ff', '#ffffff'),
  ('smartphone', 'Smartphone', '#dcd6f7', '#000000'),
  ('social', 'Social', '#46b3e6', '#ffffff'),
  ('spazio', 'Spazio', '#110133', '#ffffff'),
  ('tablet', 'Tablet', '#d597ce', '#000000'),
  ('trasporti', 'Trasporti', '#da2d2d', '#ffffff'),
  ('tv', 'TV', '#413c69', '#ffffff');

/* Indice */

CREATE TABLE IF NOT EXISTS TipiRiferimenti (
  CodTipoRiferimento VARCHAR(100) NOT NULL,
  NomeRiferimento VARCHAR(300) NOT NULL,
  SottoIndice INT(1) NOT NULL DEFAULT 0,
  
  PRIMARY KEY (CodTipoRiferimento)
);

INSERT INTO TipiRiferimenti (CodTipoRiferimento, NomeRiferimento, SottoIndice) VALUES
  ('chiacchierata', 'Chiacchierata', 0),
  ('intervista', 'Intervista', 0),
  ('notizia', 'Notizia', 0),
  ('topic', 'Topic', 0),
  ('domanda', 'Domanda', 1),
  ('capitolo', 'Capitolo', 1);

CREATE TABLE IF NOT EXISTS Indice (
  IDIndice VARCHAR(100) NOT NULL,
  Stagione INT NOT NULL,
  Episodio INT NOT NULL,
  Titolo VARCHAR(700) DEFAULT NULL,
  Descrizione VARCHAR(700) DEFAULT NULL,
  Secondi INT(100) NOT NULL DEFAULT 0,
  CodTipoRiferimento VARCHAR(100) DEFAULT 'notizia',
  
  PRIMARY KEY (IDIndice),
  FOREIGN KEY (CodTipoRiferimento) REFERENCES TipiRiferimenti(CodTipoRiferimento) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (Stagione, Episodio) REFERENCES Episodi(Stagione, Episodio) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS FontiIndice (
  IDFonte INT AUTO_INCREMENT NOT NULL,
  IDIndice VARCHAR(100) NOT NULL,
  Titolo VARCHAR(300) NOT NULL,
  Link VARCHAR(1000) DEFAULT NULL,

  PRIMARY KEY (IDFonte),
  FOREIGN KEY (IDIndice) REFERENCES Indice(IDIndice) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS TestiIndice (
  IDIndice VARCHAR(100) NOT NULL,
  Testo LONGTEXT NOT NULL,
  
  PRIMARY KEY (IDIndice),
  FOREIGN KEY (IDIndice) REFERENCES Indice(IDIndice) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS AutoriIndice (
  IDIndice VARCHAR(100) NOT NULL,
  IDPersona VARCHAR(100) NOT NULL,
  Voce INT(1) NOT NULL DEFAULT 0,
  Priorita INT(3) NOT NULL DEFAULT 0,
  
  PRIMARY KEY (IDIndice, IDPersona),
  FOREIGN KEY (IDIndice) REFERENCES Indice(IDIndice) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (IDPersona) REFERENCES Persone(IDPersona) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ArgomentiIndice (
  IDIndice VARCHAR(100) NOT NULL,
  CodArgomento VARCHAR(100) NOT NULL,
  
  PRIMARY KEY (IDIndice, CodArgomento),
  FOREIGN KEY (IDIndice) REFERENCES Indice(IDIndice) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (CodArgomento) REFERENCES Argomenti(CodArgomento) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS EpisodiCitati (
  Stagione INT NOT NULL,
  Episodio INT NOT NULL,
  StagioneCitata INT NOT NULL,
  EpisodioCitato INT NOT NULL,
  
  PRIMARY KEY (Stagione, Episodio, StagioneCitata, EpisodioCitato),
  FOREIGN KEY (Stagione, Episodio) REFERENCES Episodi(Stagione, Episodio) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (StagioneCitata, EpisodioCitato) REFERENCES Episodi(Stagione, Episodio) ON DELETE CASCADE ON UPDATE CASCADE
);

/* Contenuti extra */

CREATE TABLE IF NOT EXISTS TipiContenuto (
  CodTipoContenuto VARCHAR(32) NOT NULL,
  NomeTipoContenuto VARCHAR(200) NOT NULL,
  
  PRIMARY KEY (CodTipoContenuto)
);

INSERT INTO TipiContenuto (CodTipoContenuto, NomeTipoContenuto) VALUES
  ('film', 'Film'),
  ('instagram-igtv', 'IGTV Instagram'),
  ('instagram-post', 'Post Instagram'),
  ('instagram-video', 'Video Instagram'),
  ('libro', 'Libro'),
  ('video', 'Video'),
  ('youtube', 'Youtube');

CREATE TABLE IF NOT EXISTS ContenutiCorrelati (
  ID VARCHAR(32) NOT NULL,
  Stagione INT NOT NULL,
  Episodio INT NOT NULL,
  CodTipoContenuto VARCHAR(32) NOT NULL,
  Titolo VARCHAR(300) NOT NULL,
  Link VARCHAR(700) NOT NULL,
  LinkAnteprima VARCHAR(700) DEFAULT NULL,
  Ordine INT(5) DEFAULT 0,
  
  PRIMARY KEY (ID),
  FOREIGN KEY (Stagione, Episodio) REFERENCES Episodi(Stagione, Episodio) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (CodTipoContenuto) REFERENCES TipiContenuto(CodTipoContenuto) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS TipoMetaIndice (
  CodTipoMetaIndice VARCHAR(100) NOT NULL,
  NomeTipoMetaIndice VARCHAR(200) NOT NULL,
  
  PRIMARY KEY (CodTipoMetaIndice)
);

INSERT INTO TipoMetaIndice (CodTipoMetaIndice, NomeTipoMetaIndice) VALUES
  ('testo', 'Testo'),
  ('citazione', 'Citazione'),
  ('link', 'Link'),
  ('video', 'Video'),
  ('libro', 'Libro');

CREATE TABLE IF NOT EXISTS MetaIndice (
  IDMetaIndice VARCHAR(100) NOT NULL,
  Stagione INT NOT NULL,
  Episodio INT NOT NULL,
  Secondi INT(100) NOT NULL DEFAULT 0,
  CodTipoMetaIndice VARCHAR(100),
  Titolo VARCHAR(300) DEFAULT NULL,
  Link VARCHAR(700) DEFAULT NULL,
  IDIndiceCitato VARCHAR(100) DEFAULT NULL,
  ExtraInfoJSON LONGTEXT DEFAULT NULL,

  PRIMARY KEY (IDMetaIndice),
  FOREIGN KEY (CodTipoMetaIndice) REFERENCES TipoMetaIndice(CodTipoMetaIndice) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (Stagione, Episodio) REFERENCES Episodi(Stagione, Episodio) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (IDIndiceCitato) REFERENCES Indice(IDIndice) ON DELETE SET NULL ON UPDATE CASCADE
);

/* Raccolte */

CREATE TABLE IF NOT EXISTS Raccolte (
  IDRaccolta VARCHAR(100) NOT NULL,
  Titolo VARCHAR(200) NOT NULL,
  Descrizione LONGTEXT NOT NULL,
  Immagine LONGBLOB,
  ImageType VARCHAR(100),
  
  PRIMARY KEY (IDRaccolta)
);

CREATE TABLE IF NOT EXISTS ArgomentiRaccolte (
  IDRaccolta VARCHAR(100) NOT NULL,
  CodArgomento VARCHAR(100) NOT NULL,
  
  PRIMARY KEY (IDRaccolta, CodArgomento),
  FOREIGN KEY (IDRaccolta) REFERENCES Raccolte(IDRaccolta) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (CodArgomento) REFERENCES Argomenti(CodArgomento) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS RaccoltePuntate (
  IDRaccolta VARCHAR(100) NOT NULL,
  Stagione INT NOT NULL,
  Episodio INT NOT NULL,
  Ordine INT(5) DEFAULT 0,
  
  PRIMARY KEY (IDRaccolta, Stagione, Episodio),
  FOREIGN KEY (Stagione, Episodio) REFERENCES Episodi(Stagione, Episodio) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (IDRaccolta) REFERENCES Raccolte(IDRaccolta) ON DELETE CASCADE ON UPDATE CASCADE
);

/* Newsletter */

CREATE TABLE IF NOT EXISTS Newsletter (
  ID VARCHAR(35) NOT NULL,
  Email VARCHAR(700) NOT NULL,
  DataIscrizione DATETIME DEFAULT CURRENT_TIMESTAMP,
  Test INT(1) DEFAULT 0,
  
  PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS NewsletterInviate (
  ID INT NOT NULL AUTO_INCREMENT,
  IDDestinatario VARCHAR(35) NOT NULL,
  DataInvio DATETIME DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (ID),
  FOREIGN KEY (Stagione, Episodio) REFERENCES Episodi(Stagione, Episodio) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (IDDestinatario) REFERENCES Newsletter(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

/* Blog */

CREATE TABLE IF NOT EXISTS Blog (
  ID VARCHAR(40) NOT NULL,
  IDAutore INT DEFAULT NULL,
  Titolo VARCHAR(400) NOT NULL,
  Testo LONGTEXT NOT NULL,
  DataPubblicazione DATETIME DEFAULT CURRENT_TIMESTAMP,
  DataModifica DATETIME DEFAULT CURRENT_TIMESTAMP,
  Visibile INT(1) DEFAULT 1,
  
  PRIMARY KEY (ID),
  FOREIGN KEY (IDAutore) REFERENCES Amministratori(IDAmministratore) ON DELETE SET NULL ON UPDATE CASCADE
);

/* Bot telegram */

CREATE TABLE IF NOT EXISTS Users (
  UserID VARCHAR(32) NOT NULL,
  FirstName VARCHAR(300),
  LastName VARCHAR(300),
  UserName VARCHAR(300),
  LastMessageSent VARCHAR(700),
  RegisterTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (UserID)
);

CREATE TABLE IF NOT EXISTS Channels (
  ChatID VARCHAR(32) NOT NULL,
  Title VARCHAR(300),
  RegisterTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (ChatID)
);

CREATE TABLE IF NOT EXISTS Admins (
  UserID VARCHAR(32) NOT NULL,
  RegisterTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (UserID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);

/* Interviste */
CREATE TABLE IF NOT EXISTS Interviste (
  IDIntervista VARCHAR(100) NOT NULL,
  NomeIntervista VARCHAR(700) NOT NULL,
  Link VARCHAR(1000) DEFAULT NULL,
  DataIntervista DATETIME DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (IDIntervista)
);