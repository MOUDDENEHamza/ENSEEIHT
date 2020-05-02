import java.io.*;
import java.util.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import javax.xml.stream.*;
import javax.xml.namespace.*;
import javax.xml.stream.events.*;

/**
 * {@code PointDeVenteUtils} fournit des méthodes de classe pour les points de vente.
 */

public class PointDeVenteUtils {

	public static Iterable<PointDeVente> fromXML(final Reader in) {
		return new Iterable<PointDeVente>() {
			public Iterator<PointDeVente> iterator() {
				return new PointDeVenteXMLIterator(in);
			}
		};
	}


	private static class PointDeVenteXMLIterator implements Iterator<PointDeVente> {
		final static QName qId = new QName("id");
		final static QName qLatitude = new QName("latitude");
		final static QName qLongitude = new QName("longitude");
		final static QName qNom = new QName("nom");
		final static QName qCp = new QName("cp");
		final static QName qMaj = new QName("maj");
		final static QName qDebut = new QName("debut");
		final static QName qFin = new QName("fin");
		final static QName qValeur = new QName("valeur");

		private XMLEventReader xmler;
		private PointDeVente nextPdv;

		public PointDeVenteXMLIterator(Reader in) {
			try {
				XMLInputFactory xmlif = XMLInputFactory.newInstance();
				this.xmler = xmlif.createXMLEventReader(in);
				trouverPdvSuivant();
			} catch (XMLStreamException e) {
				throw new RuntimeException(e);
			}
		}


		@Override public boolean hasNext() {
			return nextPdv != null;
		}


		@Override public PointDeVente next() {
			PointDeVente pdv = nextPdv;
			trouverPdvSuivant();
			return pdv;
		}


		@Override public void remove() {
			throw new UnsupportedOperationException();
		}


		private void trouverPdvSuivant() {
			try {
				PointDeVenteBuilder pdvBuilder = null;
				boolean estFerme = false;
				nextPdv = null;

				boolean finished = false;
				while (xmler.hasNext() && ! finished) {
					XMLEvent event = xmler.nextEvent();
					if (event.isStartElement()) {
						StartElement startElt = event.asStartElement();
						switch (startElt.getName().toString()) {
							case "pdv":
								pdvBuilder = new PointDeVenteBuilder();
								estFerme = false;
								pdvBuilder.setIdentifiant(startElt.getAttributeByName(qId).getValue());
								pdvBuilder.setLatitude(startElt.getAttributeByName(qLatitude).getValue());
								pdvBuilder.setLongitude(startElt.getAttributeByName(qLongitude).getValue());
								pdvBuilder.setCodePostal(startElt.getAttributeByName(qCp).getValue());
								break;

							case "adresse":
								pdvBuilder.setAdresse(xmler.getElementText());
								break;

							case "ville":
								pdvBuilder.setVille(xmler.getElementText());
								break;

							case "service":
								pdvBuilder.addService(xmler.getElementText());
								break;

							case "prix":
								Attribute attr = startElt.getAttributeByName(qMaj);
								if (attr != null) {
									LocalDateTime date = LocalDateTime.parse(attr.getValue());
									int prix = Integer.parseInt(startElt.getAttributeByName(qValeur).getValue());
									String carburantId = startElt.getAttributeByName(qId).getValue();
									int carburantInt = Integer.parseInt(carburantId);
									Carburant carburant = Carburant.values()[carburantInt-1];
									pdvBuilder.addPrix(carburant, date, prix);
								}
								break;

							case "fermeture":
								estFerme = estFerme || startElt.getAttributeByName(qDebut) != null;
								break;

							default:
								// ignoré
						}
					} else if (event.isEndElement()) {
						EndElement endElt = event.asEndElement();
						switch (endElt.getName().toString()) {
							case "pdv":
								if (estFerme) {
									/*
									System.out.println("Le PDV d'id "
											+ pdvBuilder.getIdentifiant()
											+ " est fermé, donc ignoré.");
									*/
								} else {
									nextPdv = pdvBuilder.build();
									finished = true;
								}
								break;
						}
					}
				}
			} catch (XMLStreamException e) {
				// Fin !
			}
		}

	}

}
