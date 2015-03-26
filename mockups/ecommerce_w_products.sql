DROP SCHEMA IF EXISTS `ecommerce`;
CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.5.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_1` text NOT NULL,
  `line_2` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `zip` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billings`
--

DROP TABLE IF EXISTS `billings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_id` int(11) NOT NULL,
  `card` int(11) NOT NULL,
  `expires` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`address_id`),
  KEY `fk_addresses_idx` (`address_id`),
  CONSTRAINT `fk_addresses` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billings`
--

LOCK TABLES `billings` WRITE;
/*!40000 ALTER TABLE `billings` DISABLE KEYS */;
/*!40000 ALTER TABLE `billings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `following`
--

DROP TABLE IF EXISTS `following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `following` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_following_users3_idx` (`user_id`),
  KEY `fk_following_users4_idx` (`follower_id`),
  CONSTRAINT `fk_following_users3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_following_users4` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `following`
--

LOCK TABLES `following` WRITE;
/*!40000 ALTER TABLE `following` DISABLE KEYS */;
/*!40000 ALTER TABLE `following` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Alternative','2015-03-25 17:51:01','2015-03-25 17:51:01'),(2,'Blues','2015-03-25 17:51:01','2015-03-25 17:51:01'),(3,'Country','2015-03-25 17:51:01','2015-03-25 17:51:01'),(4,'Dance','2015-03-25 17:51:01','2015-03-25 17:51:01'),(5,'Electronic','2015-03-25 17:51:01','2015-03-25 17:51:01'),(6,'Hip-Hop/Rap','2015-03-25 17:51:01','2015-03-25 17:51:01'),(7,'Metal','2015-03-25 17:51:01','2015-03-25 17:51:01'),(8,'New Artist','2015-03-25 17:51:01','2015-03-25 17:51:01'),(9,'Pop','2015-03-25 17:51:01','2015-03-25 17:51:01'),(10,'Rock','2015-03-25 17:51:01','2015-03-25 17:51:01'),(11,'Reggae','2015-03-25 17:51:01','2015-03-25 17:51:01'),(12,'R&B',NULL,'2015-03-25 21:03:25');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billing_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_billing_idx` (`billing_id`),
  KEY `fk_shipping_idx` (`shipping_id`),
  CONSTRAINT `fk_billings` FOREIGN KEY (`billing_id`) REFERENCES `billings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipping` FOREIGN KEY (`shipping_id`) REFERENCES `addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist` varchar(45) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `inventory` int(11) DEFAULT NULL,
  `image_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Nightwish','Endless Forms Most Beautiful','Endless Forms Most Beautiful is the upcoming eighth album by Finnish symphonic power metal band Nightwish. It is due to be released on March 27, 2015 in the EU and Argentina, on March 30 in the UK and on March 31 in the USA.[6][7] It is the band\'s first album with new singer Floor Jansen, as well as the first to feature Troy Donockley, who played uillean pipes and various other instruments on Dark Passion Play and Imaginaerum, as a permanent member.\n\nIt is also their first album without drummer Jukka Nevalainen, who had to take a temporary break from the band due to suffering of strong insomnia, leading him to step away from both the album and its subsequent tour. All the drum parts on the album were consequently played by Kai Hahto from Wintersun and Swallow the Sun.[8] Due to this, the album features only five Nightwish members, despite being their first album released with the band being a sextet.',12.99,5,'nightw-once_08.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(2,'Nightwish','Dark Passion Play','Dark Passion Play is the sixth studio album by Finnish symphonic metal band Nightwish, released on 26 September, 2007 in Finland, 28 September in Europe and 2 October 2007 in the United States. It is the first Nightwish album with new singer Anette Olzon, the first album not featuring original vocalist Tarja Turunen, who was dismissed in 2005, as well as the first album involving future member Troy Donockley on uilleann pipes and tin whistle. Lead songwriter Tuomas Holopainen has referred to it as the \"album that saved his life\".[1]\n\nThe first single, \"Eva\", was leaked on the Internet six days before its official release, prompting the band to release the single earlier to boost downloads. Several other versions of the song were posted on YouTube and torrent sites a month later; the entire album with record label voiceovers had been leaked on the Internet by 2 August. The full album (without voiceovers) was leaked on 21 September 2007, as a result of several stores in Mexico selling the retail album much prior to the worldwide release date.',10.99,6,'nightw-darkpa_08.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(3,'Nightwish','Imaginaerum','Imaginaerum is the seventh studio album by Finnish symphonic metal band Nightwish.[2] According to Nightwish songwriter Tuomas Holopainen, the album is a concept album that tells the story of an old composer who is reminiscing of his youth on his deathbed. The album was produced alongside the movie of the same name, directed by Stobe Harju, who previously directed Nightwish\'s \"The Islander\" music video, and the album and the film share the same themes and general story.[3] It is their second and last album with vocalist Anette Olzon.\n\nThe first single off the album, \"Storytime\" was released on 9 November 2011[4] and quickly topped the Finnish single charts.[5][6] According to Iltasanomat, Imaginaerum sold more than 50,000 copies in Finland during the first day after release.[7] It has been described as Nightwish\'s best album by Sonic Seducer and has been album of the month by Dutch metal magazine Aardschok Magazine.',12.99,3,'nightw-imagin_05.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(4,'Nightwish','Wishmaster','Wishmaster is the third studio album by the Finnish symphonic metal band Nightwish, released on 8 May 2000 through Spinefarm Records in Finland. The album was released in Europe by Drakkar Entertainment on 29 May 2000 and in the US by Century Media on 6 February 2001.[6]\n\nWishmaster peaked at No. 1 in the official Finnish charts;[7] the album also debuted in the European charts at No. 21 in Germany[8] and No. 66 in France.[9] Wishmaster has sold more than 79,000 copies in Finland alone.[10]\n\nMost re-issues of the album contain the song \"Sleepwalker\", which was released in July 2000 to compete in the Finnish Eurovision Song Contest tryouts.',12.99,7,'_nightw-wishma_08.tn.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(5,'Nightwish','Oceanborn','Oceanborn is the second studio album by Finnish symphonic metal band Nightwish, released in December 1998 in Finland[5] and in the Spring of 1999 worldwide.[6] Oceanborn has sold more than 68,000 copies in Finland.[7] The single \"Sleeping Sun\" was released in August 1999 and the song has been included in every re-issue of the album since then. The album was released in the US by Century Media in March 2001.[8]',9.99,12,'nightw-oceanb_12.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(6,'Nightwish','End of an Era','End of an Era is a DVD and double CD from Finnish symphonic metal band Nightwish. Nuclear Blast recorded their live performance at the Hartwall Areena in Helsinki, Finland, on October 21, 2005, the final concert of a long worldwide tour for their album Once. During the concert the band was joined on-stage by Lakota musician John Two-Hawks, who performed \"Stone People\" from his album Honor as an introduction to \"Creek Mary\'s Blood\", which featured his voice and cedar flutes. End of an Era is the final Nightwish production to feature Tarja Turunen on vocals. She was dismissed by a letter after this concert.[4]\n\nIn addition to original Nightwish songs, three significant covers appear, their known cover of Gary Moore\'s \"Over the Hills and Far Away\", Andrew Lloyd Webber\'s \"The Phantom of the Opera\", and a cover of Pink Floyd\'s \"High Hopes\".\n\nThe running time of the concert is 1 hour and 43 minutes. The DVD also contains a 55 minute documentary about the fifteen days prior to the concert, \"A Day Before Tomorrow.\", and a photo gallery.',12.99,8,'nightw-endofa_02.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(7,'Nightwish','Century Child','Century Child is the fourth studio album by the Finnish symphonic metal band Nightwish, released in 2002 through Spinefarm Records. It is the first album which features current bassist and male vocalist Marco Hietala.\n\nSpinefarm Records released a 2-CD special edition version of the album in 2002. It includes the CD, liner art with the band members\' signatures, and a Video CD containing the music video for their cover of Gary Moore\'s \"Over the Hills and Far Away\". In addition, the booklet contains an ID code that allows the owner to download the entire album and three extra tracks from the Internet for a limited time.[6] The bonus tracks are \"Nightwish\", \"The Forever Moments\" and \"Etiäinen\", all from the band\'s first demo of 1996.\n\nThe album was certified double platinum in Finland with more than 60,000 sold copies,[7] the second most sold Finnish album in Finland in year 2002.[8] Century Child has sold more than 80,000 copies in Finland alone.[7] It sold more than 350,000 copies worldwide between 2002 and 2003.[citation needed]',9.99,34,'nightw-centur_05.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(8,'Nightwish','Angels Fall First','Angels Fall First is the debut studio album by Finnish symphonic metal band Nightwish. The original 500-copies limited edition features seven tracks, two of which are not on the regular edition.[3] This edition is highly sought after by collectors and in 2012 a copy was sold for $1137.23 on EBay.[4] The album was released in the US by Century Media in March 2001.[5]',12.99,32,'nightw-angels_08.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(9,'Beyoncé','Beyoncé','Beyoncé is the fifth studio album by American recording artist Beyoncé, released on December 13, 2013 by Parkwood Entertainment and Columbia Records. Developed as a simultaneous audio-visual medium, Beyoncé \'​s songs are accompanied by non-linear short films that illustrate the musical concepts conceived during production. Its dark, intimate subject material includes feminist themes of sex, monogamous love and relationship issues, inspired by Beyoncé\'s desire to assert her full creative freedom.\n\nThe album\'s initial recording began in New York, where Beyoncé invited producers and songwriters to live with her for a month. During extensive touring the following year, the album changed as she conceived of creating a visual accompaniment to its songs and resumed recording sessions with rock musician Boots. Their collaboration led to more sonically experimental material, which combined rhythm and blues with electronic and soul music. Throughout this period, the album\'s songs and videos were composed in strict secrecy as Beyoncé devised an unexpected release.',9.99,11,'beyonc-beyonc_17.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(10,'Beyoncé','4',' is the fourth studio album by American recording artist Beyoncé, released on June 24, 2011, by Parkwood Entertainment and Columbia Records. Following a career hiatus that reignited her creativity, Beyoncé was inspired to create a record with a basis in traditional rhythm and blues that stood apart from contemporary popular music. Her collaborations with songwriters and record producers Terius \"The-Dream\" Nash, Christopher \"Tricky\" Stewart and Shea Taylor produced a mellower tone, developing diverse vocal styles and influences from funk, hip hop and soul.\n\nSevering professional ties with father and manager Mathew Knowles, Beyoncé eschewed the music of her previous releases in favor of an intimate, personal album. 4 \'​s lyrics emphasize monogamy, female empowerment and self-reflection, a result of Beyoncé considering a maturer message to contend artistic credibility. The album was praised by critics for its fusion of various genres and her strong vocal ability; many publications included it on their year-end lists.',9.99,6,'beyonc-4_10.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(11,'Beyoncé','I Am... Sasha Fierce','I Am... Sasha Fierce is the third studio album by American recording artist Beyoncé. It was released on November 15, 2008, by Music World Entertainment and Columbia Records. In its initial release, the album was formatted as a dual disc, intending to market Beyoncé\'s contrasting facets of artistry. The first disc, I Am..., contains slow and midtempo pop and R&B ballads, while the second, Sasha Fierce (named after Beyoncé\'s on-stage alter ego), focuses on more uptempo beats that blend electropop and Europop genres. In composing the songs\' lyrics, Beyoncé worked with many writers, with each session accompanied by live orchestration.\n\nBeyoncé credited both her husband, rapper Jay-Z, and jazz singer Etta James for inspiring her to push the limits of her songwriting and artistry. Musically, I Am... drew inspiration from folk and alternative rock, while blending acoustic guitar elements into contemporary ballads. The tracks on the first disc were written and produced by Beyoncé, during collaborative efforts with Kenneth \"Babyface\" Edmonds, Christopher \"Tricky\" Stewart, Terius \"The-Dream\" Nash and Ryan Tedder. Sasha Fierce boasted production from Rodney \"Darkchild\" Jerkins and Sean \"The Pen\" Garrett. The album received generally lukewarm reviews from critics, many of whom felt that it does not properly differentiate the double-discs contrasts and goals.',12.99,23,'beyonc-iamsas_23.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(12,'Beyoncé','B\'Day','B\'Day is the second studio album by American recording artist Beyoncé; it was released to coincide with her twenty-fifth birthday on September 4, 2006 by Columbia Records in collaboration with Music World Music and Sony Urban Music. The record was originally planned as a 2004 follow-up to Beyoncé\'s debut studio album Dangerously in Love (2003), although it was delayed to accommodate the recording of Destiny\'s Child\'s final studio album Destiny Fulfilled (2004) and her starring role in the film Dreamgirls (2006). While on vacation after filming Dreamgirls, Beyoncé began contacting various producers; she rented Sony Music Studios, and completed B\'Day in three weeks. Most of the lyrical content of the album was inspired by Beyoncé\'s role in the film. The album\'s musical style ranges from 1970s–80s funk influences and balladry to urban contemporary elements such as hip hop and R&B. Live instrumentation was employed in recording most of the tracks as part of Beyoncé\'s vision of creating a record using live instruments.\n\nUpon its release, B\'Day received generally positive reviews from most music critics and has since earned Beyoncé several accolades, including the Grammy Award for Best Contemporary R&B Album at the 2007 Grammy Awards. The album debuted at number one on the US Billboard 200 chart, selling 541,000 copies in its first week, the second-highest debut-week sales of Beyoncé.',9.99,13,'beyonc-bdayde_06.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(13,'Bob Marley','Confrontation','Confrontation is a Roots reggae album by Bob Marley & the Wailers, released posthumously in May 1983, two years after Marley\'s death. The songs on this album were compiled from unreleased material and singles recorded during Marley\'s lifetime. Many of the tracks were built up from demos, most notably Jump Nyabinghi where vocals from the I-Threes were added, which were not there when Marley released the song as a dubplate in 1979. In addition the harmony vocals on Blackman Redemption and Rastaman Live Up are performed by the I-Threes in order to give the album a consistent sound – on the original single versions they are performed by The Meditations. The most famous track on the album is \"Buffalo Soldier.\" Marley expressed the wish that \"I Know\" would be released as a single after his death, which Island Records obliged.',9.99,54,'bobmar-confro_06.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(14,'Bob Marley','Uprising','Uprising is a 1980 reggae album by Bob Marley and the Wailers. Marley died the following year, and Uprising was thus the final studio album released during his lifetime. This album is one of Marley\'s most directly religious, with nearly every song addressing his Rastafarian beliefs, culminating in the acoustic folk classic, \"Redemption Song\".\n\nUprising peaked at #41 on Billboard\'s (North America) Black Albums chart, and #45 on the Pop Albums chart. \"Could You Be Loved\" was #6 and #56 respectively on the Club Play Singles and Black Singles charts. The album fared better in the UK where it was a top ten hit along with the single \"Could You Be Loved\" which reached number 5 in the UK singles charts.',12.99,8,'bmarle-uprisi_03.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(15,'Bob Marley','Survival','Survival is a roots reggae album by Bob Marley & The Wailers released in 1979.\n\nSurvival is an album with an outwardly militant theme. Some speculate that this was due in part to criticism Marley received for the laid-back, ganja-soaked atmosphere of his previous release, \"Kaya\", which seemed to sidetrack the urgency of his message. In the song \"Africa Unite\", Marley proclaims Pan-African solidarity. The song \"Zimbabwe\" is a hymn dedicated to later-independent Rhodesia. The song was performed at Zimbabwe\'s Independence Celebration in 1980, just after the official declaration of Zimbabwe\'s independence. \"Zimbabwe\" is seen as an unofficial national song.\n\nSurvival was originally to be called Black Survival to underscore the urgency of African unity, but the name was shortened to prevent misinterpretations of the album\'s theme. Marley originally planned to release Survival as the first part of a trilogy, followed by Uprising in 1980 and Confrontation in 1983.\n\nIn South Africa the album was partly censored by the then white apartheid government.[3]',9.99,22,'bobmar-surviv.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(16,'Bob Marley','Kaya','Kaya is a roots reggae album released by Bob Marley and the Wailers in 1978. The album consists of tracks recorded alongside those present on the Exodus album in 1977. The album has a very relaxed, laid back sound, lacking much of the militant quality of the Wailers lyrically and musically. They received criticism for \'going soft\' as a result of the general sound of the album as well as the theme: songs primarily revolving around love, as well as marijuana. The album\'s release coincided with the One Love Peace Concert, heralding Marley\'s triumphant return to Jamaica from exodus in London. Many of the songs present on this album, as well as its sister album Exodus, are rerecorded versions of older tracks present on the album \"Soul Revolution Part II\" and the \"African Herbsman\" compilation album. Well known songs from the album include \"Is This Love\" and \"Satisfy My Soul\". Kaya reached the top five in the UK album charts.',12.99,9,'bobmar-kayawi.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(17,'Bob Marley','Exodus','Exodus is the ninth studio album by Jamaican reggae recording band Bob Marley and the Wailers, first released 3 June 1977 though Island Records. Following the disbandment of the groups original member\'s Marley was joined by a new backing band in which they released their first major success Rastaman Vibration (1976). On 3 December 1976, an assassination attempt was made on Bob Marley’s life in which his chest was grazed and his arm was struck, but he survived.[1] Following the assassination attempt Marley left Jamaica and was exiled to London where Exodus was recorded.[2]\n\nExodus is a reggae album, but it also incorporates elements of blues, soul, British rock and funk. The album\'s production has been characterized as laid-back with pulsating bass beats and an emphasis on piano, trumpet and guitar. Unlike previous albums from the Wailers, Exodus thematically moves away from cryptic story-telling; instead it revolves around themes of change, religious politics, and sex. The album is split into two halves: the first half revolves around religious politics while the second half is focused on themes of sex and keeping faith.\n\nThe album was a success both critically and commercially; receiving gold certifications in the US, UK and Canada. Exodus is widely considered to be the album that propelled Marley to international stardom.[1] In 2007 Exodus was remastered and re-released for its 30th anniversary. The re-release sparked new interest in the album, which many now argue is one of Marley\'s best works. Exodus has more tracks on Marley’s greatest hits album, Legend which is the highest selling reggae album of all time, than any of his other records.[1]',10.99,21,'bobmar-exodus_05.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(18,'Bob Marley','Rastaman Vibration','Rastaman Vibration is a reggae album by Bob Marley & The Wailers released on 30 April 1976. The album was a great success in the USA, becoming the first Bob Marley release to reach the top 10 on the Billboard 200 charts (peaking at number 8), in addition to releasing Marley\'s most popular US single \"Roots, Rock, Reggae,\" the only Marley single to reach the Billboard Hot 100 charts, peaking at No. 51. Synthesizers are featured prominently on this album, adding a breezy embellishment to otherwise hard-driving songs with strong elements of rock guitar. This is one of the three Wailers solo albums released in 1976, along with Blackheart Man by Bunny Wailer and Legalize It by Peter Tosh.',9.99,4,'bobmar-rastam_02.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(19,'Bob Marley','Natty Dread','Natty Dread is a 1974 reggae album by Bob Marley & The Wailers. An important transition in Marley\'s discography, Natty Dread was the first album released as Bob Marley & the Wailers (as opposed to The Wailers) and the first recorded without former bandmates Peter Tosh and Bunny Wailer. It is also the first album recorded with the I-Threes, a female vocal trio that included Bob\'s wife, Rita Marley, along with Marcia Griffiths and Judy Mowatt.\n\nNatty Dread peaked at No. 44 on Billboard\'s (North America) Black Albums chart, and at No. 92 on the Pop Albums chart. In 2003, the album was ranked number 181 on Rolling Stone magazine\'s list of the 500 greatest albums of all time. [5]',12.99,1,'bobmar-nattyd.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(20,'Bob Marley','Burnin','Burnin\' is a reggae album by The Wailers, released in 1973. The sixth album by Bob Marley, Peter Tosh and Bunny Wailer (the last before Tosh and Bunny departed for solo careers and the band became known as Bob Marley and the Wailers), Burnin′ opens with a signature song, the call to action \"Get Up, Stand Up\" and includes a more confrontational and militant tone than previous records, such as in another Marley standard turned into a #1 hit by Eric Clapton, \"I Shot the Sheriff\". The songs \"Duppy Conqueror\", \"Small Axe\", \"Put It On\" and \"Pass It On\" are re-recordings of songs previously released.\n\nBurnin\' peaked at number 151 and number 41 on the Billboard 200 and Black Albums charts respectively.\n\n\nThe Wailers\' gold record award for Burnin\' in Nine Mile, Jamaica\n',12.99,2,'bobmar-burnin.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(21,'Bob Marley','Catch a Fire','Catch a Fire, released on 13 April 1973, is the fifth album by Jamaican reggae band The Wailers, and the first the band released on Island Records.[1] After touring and recording in the United Kingdom with Johnny Nash, Nash\'s departure to the United States left the band without enough money to return home; they approached producer Chris Blackwell, who agreed to advance the Wailers money for an album and paid their fares back to Jamaica, where they recorded Catch a Fire. The album features nine songs, two of which were written by Peter Tosh and the rest by Bob Marley. After Marley\'s return to London to present the tapes to Blackwell, the producer reworked the tracks with contributions by Muscle Shoals session musician Wayne Perkins, who played guitar on two overdubbed tracks.',9.99,13,'bobmar-catcha_08.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(22,'Cheech & Chong','Where There\'s Smoke There\'s Cheech & Chong','Where There\'s Smoke There\'s... Cheech & Chong is an anthology album by Cheech & Chong. Released in 2002, it collects the duo\'s most popular comedy routines and songs from their eight studio albums, and additional rare material, including tracks that are exclusive to this set, including radio commercials for the film Up in Smoke, \"(How I Spent My Summer Vacation) Or A Day At The Beach With Pedro & Man\", which was previously only released as a single, and a live recording of the duo performing the \"Old Man In The Park\" sketch.',12.99,11,'cheech-wheres_03.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(23,'Cheech & Chong','Cheech & Chong\'s Greatest Hit','Cheech & Chong\'s Greatest Hit is a comedy album by Cheech & Chong. The album is a \"greatest hits\" compilation, featuring some of their best known comedy bits. Much to some fans disliking, some tracks were edited for this release. Oddly, the 1:34 track \"Dave\" is broken into two separate tracks, and is edited down for time. Also, \"Earache My Eye\" fades out just before the argument between father and son.',9.99,31,'cheech-cheech_06.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(24,'Cheech & Chong','Get Out of My Room','Get Out of My Room is an album and short-form video featuring comedians Cheech & Chong, released in 1985. The album and video marked the last release by the longtime comedy duo, with Cheech leaving in 1986 in order to focus on his mainstream acting career. The opening track \"Born In East L.A.\" and \"I\'m Not Home Right Now\" were the only singles released for the album.',12.99,2,'cheech-getout.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(25,'Cheech & Chong','Let\'s Make a New Dope Deal','Let\'s Make a New Dope Deal is a 1980 comedy album recorded by Cheech & Chong. Originally released on LP, 8-track and cassette in 1980. The long out-of-print album was finally released on CD on November 15, 2005, along with another long awaited out-of-print (since the early 1990s) album, Sleeping Beauty.\n\nA single for \"Bloat On\", a parody of \"Float On\" by R&B group The Floaters was released with a non-album B-side entitled \"Just Say \'Right On\'\" with a picture sleeve depicting animated overweight versions of Cheech and Chong.',12.99,9,'cheech-letsma.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(26,'Cheech & Chong','Up in Smoke','Up in Smoke is the soundtrack for the 1978 Cheech & Chong film Up in Smoke. Released in 1979, the album featured music and audio excerpts from the film. The album was originally released in 1979 by Warner Bros. Records. It was released on compact disc in 1991.\n\nCountry artist Hank Williams III covered \"Up In Smoke\" as part of a \"hidden\" 42-minute track on his 2006 album Straight to Hell.',9.99,12,'cheech-upinsm.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(27,'Cheech & Chong','Sleeping Beauty','Sleeping Beauty is a 1976 comedy album recorded by Cheech & Chong. Since 1976, this album was only available on vinyl LP, then, in 1992 it was briefly reissued on CD and cassette and has since become out of print. On November 15, 2005, the long out-of-print album was finally re-released and digitally re-mastered on CD, along with Let\'s Make a New Dope Deal.',12.99,5,'cheech-sleepi.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(28,'Cheech & Chong','Cheech & Chong\'s Wedding Album','Cheech & Chong\'s Wedding Album is a 1974 comedy album recorded by Cheech & Chong.\n\nThe original vinyl LP contained unique artwork that made the album look like an actual wedding album. In the sleeve\'s spread, you can find photos in which the duo are dressed up like conjoined twins, and are married to an extremely pregnant woman with a bag over her head. Original sleeve inserts had mail order information for various Cheech and Chong items, including candles and T-Shirts.',8.99,8,'cheech-cheech_02.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(29,'Cheech & Chong','Los Cochinos','Los Cochinos (\"The Pigs\") is a 1973 comedy album recorded by Cheech & Chong. The Spanish term cochino is a derogatory way of referring to a pig, as it also means \"dirty\", in contrast to cerdo, a more neutral word for a pig as an animal. In this context, \"cochino\" (\"[dirty] pig\") equates to the American derogatory term \"pig\" for policeman.',9.99,2,'cheech-loscoc.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(30,'Cheech & Chong','Big Bambu','Big Bambú is the second album by Cheech & Chong, released in 1972. The name Big Bambu is a reference to a type of rolling paper made by the Bambu company; the original LP sleeve was designed by Ernie Cefalu and manufactured to look like a giant rolling paper package, and originally contained a giant rolling paper with the record. Since its release, vinyl copies with the rolling paper have been notably hard to find. The original CD packaging has been slightly reformatted, and does not contain rolling papers of any size.\n\nIn a mixed but mostly positive review published in Rolling Stone, Janet Maslin singled out the duo\'s voice work for particular praise. \"The thing Cheech and Chong are great with is voices. Each has terrific ears for dialect, anything from spare change wino to jiveass soul, and there are at least 20 distinct personae showing up here, all of them cleverly done.\"[2]\n\nThe album was nominated for Best Comedy Recording at the 15th Grammy Awards, but lost to George Carlin\'s FM & AM.',9.99,4,'cheech-bigbam.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(31,'Cheech & Chong','Cheech and Chong','Cheech and Chong is the 1971 self-titled debut album of Cheech & Chong, produced by Lou Adler. It features \"Dave\", one of their most famous routines. The album peaked at #28 on the Billboard 200 the week of March 4, 1972. The album was nominated for Best Comedy Recording at the 14th Grammy Awards, but lost to Lily Tomlin\'s This Is a Recording.\n\nAt Christmas that year, a single was released with \"Dave\" on the B-side and with \"Santa Claus and His Old Lady\" (a sketch not available on any LPs) on the A-side. The single peaked at #38.\n\nA possible bootleg of this LP has appeared on the Melody label (Melody SS-6020) with the same selections. The cover is totally different from the copies on Ode and later reissued on Warner Brothers. The Melody label was based in West Caldwell, New Jersey.',12.99,14,'cheech-cheech_07.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(32,'Dum Dum Girls','End of Daze','End of Daze is the fourth EP by Dum Dum Girls[2] released September 25, 2012. This was the third Dum Dum Girls release in a row produced by Richard Gottehrer and The Raveonettes\' Sune Rose Wagner, and the fourth overall for Gottehrer.',12.99,2,'600x600.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(33,'Dum Dum Girls','He Gets Me High','The album received generally positive reviews upon its release. At Metacritic, which assigns a rating out of 100 to reviews from mainstream critics, the album received an average score of 76, based on 11 reviews, which indicates \"Generally favorable reviews\".[3]',9.99,1,'dumdum-hegets_02.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(34,'Dum Dum Girls','Dum Dum Girls [EP]','Dum Dum Girls is the second EP - and the second self-titled EP - by Dum Dum Girls, and was released September 9, 2009. It was only available on 12\" vinyl.[1] It includes an early version of the title track, which also would later appear on their debut LP I Will Be. The EP is occasionally referred to as Yours Alone by fans and frontwoman Dee Dee Penny.',12.99,4,'ddg-promo_logo.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(35,'Dum Dum Girls','Dum Dum Girls','Dum Dum Girls is the debut EP by Dum Dum Girls, and was released 2008 by frontwoman Dee Dee Penny\'s own label Zoo Music. The release was initially limited to 100 pressings,[1] but later re-pressed in CD-R format by Sub Pop and offered to those who preordered their debut album I Will Be.[2]',12.99,5,'ddg-promo_logo.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(36,'Dum Dum Girls','Too True','Too True is the third album by Dum Dum Girls,[2] and was released January 22, 2014 in Japan, January 27, 2014 in Europe, and January 28, 2014 worldwide. The album marks the fourth Dum Dum Girls release in a row produced by Richard Gottehrer and The Raveonettes\' Sune Rose Wagner, and the fifth overall for Gottehrer. The album reached number 138 on the UK Albums Chart.[3]',9.99,1,'dumdum-tootru_02.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(37,'Dum Dum Girls','Only in Dreams','Only in Dreams is the second album by Dum Dum Girls,[3] and was released September 26, 2011.',10.99,14,'dumdum-onlyin_02.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(38,'Dum Dum Girls','I Will Be','I Will Be is the debut album by Dum Dum Girls, released on March 30, 2010. The first pressing by HoZac Records was released as a 12\" vinyl LP with a black and white version of the current album art. Once the band signed to Sub Pop, the album was rereleased later in 2010 on both CD and 12\" vinyl with the full colored cover.',9.99,4,'dumdum-iwillb_04.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(39,'Killing Joke','MMXII','MMXII is the fifteenth studio album by English rock band Killing Joke, released on 2 April 2012 by record label Spinefarm and distributed worldwide by Universal Music Group.',9.99,33,'killin-mmxii2.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(40,'Killing Joke','What\'s THIS For...!','What\'s THIS For...! is the second studio album by English rock band Killing Joke. It was released in June 1981 by record label E.G.',11.99,7,'killin-whatst.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(41,'Killing Joke','Revelations','Revelations is the third studio album by English rock band Killing Joke, released in July 1982 by record label E.G.',12.99,8,'killin-revela.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(42,'Killing Joke','Fire Dances','Fire Dances is the fourth studio album by English post-punk band Killing Joke, recorded from February to March 1983 and released in July 1983 by record label E.G..',12.99,7,'killin-fireda_04.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(43,'Killing Joke','Night Time','This article is about the Killing Joke album. For the song by the J. Geils Band, see Love Stinks. For ITV night time, see Night Network.\n\"Night Time\" redirects here. For night-time, see night time.\nNight Time\n\nStudio album by Killing Joke\nReleased	March 1985\nRecorded	August–September 1984 at Hansa Tonstudios, Berlin, Germany\nGenre	Post-punk, new wave, gothic rock\nLength	39:54\nLabel	E.G.\nProducer	Chris Kimsey\nKilling Joke chronology\nFire Dances\n(1983)	Night Time\n(1985)	Brighter than a Thousand Suns\n(1986)\nSingles from Night Time\n\"Eighties\"\nReleased: April 1984\n\"Love Like Blood\"\nReleased: January 1985\n\"Kings and Queens\"\nReleased: March 1985\nNight Time is the fifth studio album by English post-punk band Killing Joke. It was released in March 1985, through record label E.G.',10.99,6,'killin-nightt.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(44,'Killing Joke','Brighter Than a Thousand Suns','Brighter Than a Thousand Suns is the sixth studio album by English rock band Killing Joke. It was released in November 1986 by record label E.G.',12.99,5,'killin-bright_04.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(45,'Killing Joke','Outside the Gate','Outside the Gate is the seventh album by English rock band Killing Joke, recorded between July and August 1987 and released in June 1988. It displayed a shift in style towards synthpop, and was poorly received by fans and critics alike.',12.99,4,'k_j_outside.jpeg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(46,'Killing Joke','Extremities, Dirt and Various Repressed Emotions','Extremities, Dirt and Various Repressed Emotions is the ninth studio album by English rock band Killing Joke, recorded in August 1990 and in November 1990 by record label Noise. This is the only Killing Joke album to feature drummer Martin Atkins (formerly of Public Image Ltd. and Brian Brain).',10.99,3,'killin-extrem_03.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(47,'Killing Joke','Pandemonium','Pandemonium is the tenth studio album by English rock band Killing Joke, released on 2 August 1994 by record label Butterfly. This album marked Killing Joke\'s return after a four-year-long hiatus, the longest the band has taken since it was initially founded. This album also featured the return of founding member Martin \"Youth\" Glover, who replaced Paul Raven on bass.',12.99,22,'killin-pandem_02.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(48,'Killing Joke','Democracy','Democracy is the eleventh studio album by English rock band Killing Joke. It was released on 1 April 1996 by record label Big Life.',10.99,13,'killin-democr.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(49,'Killing Joke','Killing Joke','Killing Joke is the twelfth studio album by English rock band Killing Joke, released on 28 July 2003 by record label Zuma Recordings. Recording for the album in 2002 marked the end of a six-year hiatus that began in 1996 and it was Killing Joke\'s first studio album in seven years. Produced by Andy Gill of Gang of Four, the album featured long-time Killing Joke fan Dave Grohl on drums. This is also Killing Joke\'s second self-titled album, as an effect of the hiatus.',9.99,13,'killin-killin_11.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(50,'Killing Joke','Hosannas from the Basements of Hell','Hosannas from the Basements of Hell is the thirteenth studio album by English rock band Killing Joke, released on 3 April 2006 by record label Cooking Vinyl.',9.99,2,'killin-hosann.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(51,'Killing Joke','Absolute Dissent','Absolute Dissent is the fourteenth studio album by Killing Joke. It represents the first studio album and the second recording —it was preceded by the In Excelsis EP on July 2010— in 28 years from the band\'s original line-up of Jaz Coleman (vocals), Kevin \"Geordie\" Walker (guitar), Martin \"Youth\" Glover (bass), and Paul Ferguson (drums). The album was going to be called Feast of Fools, but they decided to not use that track and they chose Absolute Dissent for the title of the album and of its opening track.[1] The album was released on 27 September 2010 in the United Kingdom and Japan,[2] and on 1 October in Europe on Spinefarm Records, marking the 30th Anniversary for Killing Joke.[3][4][5][6][7][8] It was released in the United States in November 2010[9][10] and distributed worldwide via Universal Music Group.[2]\n\nThe album, which features twelve tracks, was engineered and mixed by Clive Goddard, and produced by the band. It was released on various formats including CD, double coloured vinyl and a 2-CD deluxe edition featuring a bonus disc entitled Absolute Respect with Killing Joke\'s songs covered by Metallica, Amen, Helmet, Econoline Crush, Dead by April, Nine Inch Nails, The Mad Capsule Markets, Nouvelle Vague, Fear Factory, Foo Fighters, and Kotiteollisuus.[3][4][11]',12.99,3,'killin-absolu_03.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(52,'Killing Joke','MMXII','MMXII is the fifteenth studio album by English rock band Killing Joke, released on 2 April 2012 by record label Spinefarm and distributed worldwide by Universal Music Group.',12.99,7,'killin-mmxii2.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(53,'Slipknot','.5: The Gray Chapter','.5: The Gray Chapter is the fifth major label studio album by American heavy metal band Slipknot.[2] It was released in Australia, Belgium and the Netherlands on October 17, 2014, the UK on October 20, 2014 and in North America on October 21, 2014.[3] It is the first studio album by the band in six years and the first to not feature founding bassist Paul Gray and long time drummer Joey Jordison due to the death of Gray in 2010 (the title of the album being a reference to his name), and the departure of Jordison in late 2013.[2] The album includes eight singles and has received commercial and critical acclaim. Most critics noted and praised the return of their older sound from Slipknot and Iowa, while maintaining the melodies the band explored on Vol. 3: (The Subliminal Verses). A standard and deluxe edition of the album was released.',10.99,6,'slipkn-5thegr.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(54,'Slipknot','All Hope Is Gone','All Hope Is Gone is the fourth major label studio album by American heavy metal band Slipknot. Released on August 20, 2008 by Roadrunner Records, the album was published in two versions: the standard album in a Compact Disc case and a special edition packaged in a six-fold digipak containing three bonus tracks, a 40 page booklet, and a bonus DVD with a documentary of the album\'s recording. Preparation for the album began in 2007, while recording started in February 2008 in the band\'s home state of Iowa. All Hope Is Gone is Slipknot\'s first studio album since 2004\'s Vol. 3: (The Subliminal Verses). Before the album\'s launch, Slipknot released a series of promotional images and audio samples from the album through various websites. All Hope Is Gone is considered the band\'s most eclectic-sounding album, incorporating elements from their previous three. All Hope Is Gone includes their \"brutal\" edge, such as the track \"All Hope Is Gone\", reminiscent of songs such as \"(sic)\" from their debut self-titled album; slow burning, \"trippy\" elements such as \"Gehenna\", reminiscent of \"Skin Ticket\" from their second album Iowa; and acoustics (\"Snuff\"), which was first introduced on Vol. 3: (The Subliminal Verses).',12.99,7,'slipkn-allhop_06.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(55,'Slipknot','Vol. 3: (The Subliminal Verses)','Vol. 3: (The Subliminal Verses) is the third major label studio album by American heavy metal band Slipknot. The album was released on May 25, 2004, through Roadrunner Records, and a special edition, containing a bonus disc, was released on April 12, 2005. It is the band\'s only album produced by Rick Rubin, and also the only one not to feature profanity. Following the band’s tour to promote its second album in 2002, speculation regarding the future began. Some band members had already been involved in side projects including Murderdolls, To My Surprise, and the reformation of Stone Sour. In 2003, Slipknot moved into The Mansion to work on the album. Initially, the band was unproductive; lead vocalist Corey Taylor was drinking heavily. Nevertheless, they wrote more than enough material for a new album—the band’s first to incorporate more traditional, melodic song structures, guitar solos and acoustic guitars.',9.99,3,'slipkn-vol3th_14.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(56,'Slipknot','Iowa','Iowa is the second major label studio album by American heavy metal band Slipknot. Released by Roadrunner Records on August 28, 2001, it was produced by Ross Robinson and Slipknot. The title derives from the band\'s home state, Iowa, which members have stated is one of their greatest sources of inspiration. With much anticipation for the band\'s second album following on the success of their 1999 self-titled debut, pressures on the band were high. Their relationships with each other suffered and was later described as the darkest time of their career.[1] It was also the first time that guitarist Jim Root had been significantly involved in a Slipknot album due to his joining very late in recording of their debut album, as Root was only featured on two songs from that release. Despite troubles within the band and with Iowa\'s development, Slipknot promoted it for almost a year.',10.99,12,'slipkn-iowa_03.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(57,'Slipknot','Slipknot','Slipknot is the major label debut studio album by American heavy metal band Slipknot. It was released on 29 June 1999 through Roadrunner Records, following a demo containing a few of the songs which had been released in 1998, and was reissued in December 1999 with a slightly altered track listing and mastering as the result of a lawsuit. It was the first release by the band to be produced by Ross Robinson, who sought to refine Slipknot\'s sound rather than alter the group\'s musical direction.\n\nThe album spans several genres, but is generally noted for its extensive percussion and overall heavy sound. It was well received by fans and critics alike and was responsible for bringing Slipknot a large increase in popularity. The album peaked at number 51 on the Billboard 200, and has gone on to become certified double platinum in the United States, making it the band\'s best selling album. It was voted the best debut album of the last 25 years by readers of Metal Hammer magazine.[1]',12.99,2,'slipkn-slipkn_06.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30'),(58,'Liberace','Liberace','Liberace\'s fame in the United States was matched for a time in the United Kingdom. In 1956, an article in the Daily Mirror by columnist Cassandra (William Connor)[51] described Liberace as \"…the summit of sex—the pinnacle of masculine, feminine, and neuter. Everything that he, she, and it can ever want… a deadly, winking, sniggering, snuggling, chromium-plated, scent-impregnated, luminous, quivering, giggling, fruit-flavoured, mincing, ice-covered heap of mother love\", a description which strongly implied that he was homosexual without actually saying so explicitly.[52]\n\nLiberace sent a telegram that read: \"What you said hurt me very much. I cried all the way to the bank.\"[31] (this phrase was already in use by the 1940s)[31] He sued the newspaper for libel,[53] testifying in a London court that he was not a homosexual and that he had never taken part in homosexual acts. He won the suit, partly on the basis of Connor\'s use of the derogatory expression \"fruit-flavoured\". The case partly hinged on whether Connor knew that \'fruit\' was American slang implying that an individual is a homosexual.[54] The £8,000 damages he received from the Daily Mirror led Liberace to repeat the catchphrase to reporters: \"I cried all the way to the bank!\"[55] Liberace\'s popularization of the phrase inspired the title of Crying All the Way to the Bank, a detailed report of the trial based on transcripts, court reports and interviews, by the former Daily Mirror journalist Revel Barker.',29.99,34,'liberace.jpg','2015-03-26 02:05:30','2015-03-26 02:05:30');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_genres`
--

DROP TABLE IF EXISTS `products_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_genres` (
  `product_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`genre_id`),
  KEY `fk_products_idx` (`product_id`),
  KEY `fk_genres_idx` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_genres`
--

LOCK TABLES `products_genres` WRITE;
/*!40000 ALTER TABLE `products_genres` DISABLE KEYS */;
INSERT INTO `products_genres` VALUES (1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(7,7),(8,7),(9,12),(10,12),(11,12),(12,12),(13,11),(14,11),(15,11),(16,11),(17,11),(18,11),(19,11),(20,11),(21,11),(22,13),(23,13),(24,13),(25,13),(26,13),(27,13),(28,13),(29,13),(30,13),(31,13),(32,10),(33,10),(34,10),(35,10),(36,10),(37,10),(38,10),(39,10),(40,10),(41,10),(42,10),(43,10),(44,10),(45,10),(46,10),(47,10),(48,10),(49,10),(50,10),(51,10),(52,10),(53,7),(54,7),(55,7),(56,7),(57,7),(58,7);
/*!40000 ALTER TABLE `products_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_orders`
--

DROP TABLE IF EXISTS `products_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_orders` (
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`order_id`),
  KEY `fk_products_has_orders_orders1_idx` (`order_id`),
  KEY `fk_products_has_orders_products1_idx` (`product_id`),
  CONSTRAINT `fk_products_has_orders_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_orders_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_orders`
--

LOCK TABLES `products_orders` WRITE;
/*!40000 ALTER TABLE `products_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `similar_products`
--

DROP TABLE IF EXISTS `similar_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `similar_products` (
  `product_id` int(11) NOT NULL,
  `similar_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`similar_id`),
  KEY `fk_products_has_products_products2_idx` (`similar_id`),
  KEY `fk_products_has_products_products1_idx` (`product_id`),
  CONSTRAINT `fk_products_has_products_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_products_products2` FOREIGN KEY (`similar_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `similar_products`
--

LOCK TABLES `similar_products` WRITE;
/*!40000 ALTER TABLE `similar_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `similar_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'root','root@localhost.co','d660ZhV0lHz3U','2015-03-26 02:07:39','2015-03-26 02:08:50');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-25 19:11:32
