import SwiftUI
import AppKit
import UniformTypeIdentifiers
import Vision

let styles = ["Original", "Folder Full", "Folder Center", "Dark Folder", "macOS App", "Drive", "Silver Drive", "USB", "SD Card", "Document Full", "Document Center", "Booklet", "DVD Case", "Box", "Blu-ray Case", "CD Case", "CD Sleeve", "CD Disc", "Vinyl", "MiniDisc", "Film", "Floppy", "Circle Full", "iOS", "Android", "iMessage", "Circle Frame", "Square", "Slip Cover", "Tilted", "Stack", "Poster", "Polaroid", "Cartridge", "Cartridge 2", "Stamp", "VCard"]
let frenchStyles = ["Original", "Dossier complet", "Dossier centré", "Dossier sombre", "App macOS", "Lecteur", "Lecteur argent", "Clé USB", "Carte SD", "Document complet", "Document centré", "Livret", "Boîtier DVD", "Boîte", "Boîtier Blu-ray", "Boîtier CD", "Pochette CD", "Disque CD", "Vinyle", "MiniDisc", "Film", "Disquette", "Rond complet", "iOS", "Android", "iMessage", "Rond cadré", "Carré", "Étui", "Incliné", "Pile", "Affiche", "Polaroid", "Cartouche", "Cartouche 2", "Timbre", "Carte de visite"]
let translations: [String: [String: String]] = [
"fr": ["drop":"Glissez une image ici", "choose":"Choisir une image", "hint":"Photos, PNG, JPEG, HEIC, TIFF, PDF ou SVG • Dépôt multiple accepté", "styles":"Styles d’icônes", "adjust":"Personnaliser", "zoom":"Zoom", "rotation":"Rotation", "horizontal":"Position horizontale", "vertical":"Position verticale", "background":"Fond", "transparent":"Transparent", "text":"Texte ou emoji", "remove":"Supprimer l’arrière-plan", "reset":"Réinitialiser", "export":"Exporter sur le Bureau", "format":"Format", "all":"Tous les styles", "batch":"Toutes les images importées", "name":"Nom du fichier", "apply":"Appliquer à un fichier / dossier…", "restore":"Restaurer une icône…", "ready":"Prêt", "fit":"Image entière", "fill":"Remplir", "import":"Importer", "reveal":"Afficher dans le Finder", "empty":"Importez une image pour commencer", "exported":"Export terminé", "language":"Langue", "mirror":"Miroir", "size":"Taille du texte"],
"es": ["drop":"Arrastra una imagen aquí", "choose":"Elegir imagen", "styles":"Estilos de iconos", "adjust":"Personalizar", "zoom":"Zoom", "rotation":"Rotación", "background":"Fondo", "transparent":"Transparente", "text":"Texto o emoji", "remove":"Eliminar fondo", "reset":"Restablecer", "export":"Exportar al escritorio", "format":"Formato", "all":"Todos los estilos", "batch":"Todas las imágenes", "name":"Nombre", "apply":"Aplicar a archivo / carpeta…", "restore":"Restaurar icono…", "fit":"Imagen completa", "fill":"Rellenar", "import":"Importar", "language":"Idioma"],
"de": ["drop":"Bild hier ablegen", "choose":"Bild auswählen", "styles":"Symbolstile", "adjust":"Anpassen", "zoom":"Zoom", "rotation":"Drehung", "background":"Hintergrund", "transparent":"Transparent", "text":"Text oder Emoji", "remove":"Hintergrund entfernen", "reset":"Zurücksetzen", "export":"Auf Schreibtisch exportieren", "format":"Format", "all":"Alle Stile", "batch":"Alle Bilder", "name":"Dateiname", "apply":"Auf Datei / Ordner anwenden…", "restore":"Symbol wiederherstellen…", "fit":"Ganzes Bild", "fill":"Füllen", "import":"Importieren", "language":"Sprache"],
"it": ["drop":"Trascina un’immagine qui", "choose":"Scegli immagine", "styles":"Stili icone", "adjust":"Personalizza", "rotation":"Rotazione", "background":"Sfondo", "transparent":"Trasparente", "text":"Testo o emoji", "remove":"Rimuovi sfondo", "reset":"Ripristina", "export":"Esporta sulla Scrivania", "format":"Formato", "all":"Tutti gli stili", "batch":"Tutte le immagini", "name":"Nome del file", "apply":"Applica a file / cartella…", "restore":"Ripristina icona…", "fit":"Immagine intera", "fill":"Riempi", "import":"Importa", "language":"Lingua"]]
let english: [String:String] = ["drop":"Drop an image here", "choose":"Choose image", "hint":"Photos, PNG, JPEG, HEIC, TIFF, PDF or SVG • Multiple files accepted", "styles":"Icon styles", "adjust":"Customize", "zoom":"Zoom", "rotation":"Rotation", "horizontal":"Horizontal position", "vertical":"Vertical position", "background":"Background", "transparent":"Transparent", "text":"Text or emoji", "remove":"Remove background", "reset":"Reset", "export":"Export to Desktop", "format":"Format", "all":"All styles", "batch":"All imported images", "name":"File name", "apply":"Apply to file / folder…", "restore":"Restore an icon…", "ready":"Ready", "fit":"Fit", "fill":"Fill", "import":"Import", "reveal":"Show in Finder", "empty":"Import an image to begin", "exported":"Export complete", "language":"Language", "mirror":"Mirror", "size":"Text size"]


let extraTranslations: [String:[String:String]] = [
"es":["hint":"Fotos, PNG, JPEG, HEIC, TIFF, PDF o SVG • Varios archivos", "zoom":"Zoom", "horizontal":"Posición horizontal", "vertical":"Posición vertical", "ready":"Listo", "reveal":"Mostrar en Finder", "empty":"Importa una imagen para empezar", "exported":"Exportación terminada", "mirror":"Espejo", "size":"Tamaño del texto"],
"de":["hint":"Fotos, PNG, JPEG, HEIC, TIFF, PDF oder SVG • Mehrere Dateien", "horizontal":"Horizontale Position", "vertical":"Vertikale Position", "ready":"Bereit", "reveal":"Im Finder anzeigen", "empty":"Zuerst ein Bild importieren", "exported":"Export abgeschlossen", "mirror":"Spiegeln", "size":"Textgröße"],
"it":["hint":"Foto, PNG, JPEG, HEIC, TIFF, PDF o SVG • Più file", "zoom":"Zoom", "horizontal":"Posizione orizzontale", "vertical":"Posizione verticale", "ready":"Pronto", "reveal":"Mostra nel Finder", "empty":"Importa un’immagine per iniziare", "exported":"Esportazione completata", "mirror":"Specchio", "size":"Dimensione testo"]]
let localizedStyles: [String:[String]] = [
"es":["Original","Carpeta completa","Carpeta centrada","Carpeta oscura","App macOS","Unidad","Unidad plateada","Memoria USB","Tarjeta SD","Documento completo","Documento centrado","Libreto","Caja DVD","Caja","Caja Blu-ray","Caja CD","Funda CD","Disco CD","Vinilo","MiniDisc","Película","Disquete","Círculo completo","iOS","Android","iMessage","Círculo enmarcado","Cuadrado","Estuche","Inclinado","Pila","Póster","Polaroid","Cartucho","Cartucho 2","Sello","Tarjeta"],
"de":["Original","Ordner gefüllt","Ordner zentriert","Dunkler Ordner","macOS App","Laufwerk","Silberlaufwerk","USB-Stick","SD-Karte","Dokument gefüllt","Dokument zentriert","Broschüre","DVD-Hülle","Box","Blu-ray-Hülle","CD-Hülle","CD-Tasche","CD","Schallplatte","MiniDisc","Film","Diskette","Kreis gefüllt","iOS","Android","iMessage","Kreisrahmen","Quadrat","Schuber","Geneigt","Stapel","Poster","Polaroid","Modul","Modul 2","Briefmarke","Visitenkarte"],
"it":["Originale","Cartella piena","Cartella centrata","Cartella scura","App macOS","Unità","Unità argento","Chiavetta USB","Scheda SD","Documento pieno","Documento centrato","Libretto","Custodia DVD","Scatola","Custodia Blu-ray","Custodia CD","Busta CD","Disco CD","Vinile","MiniDisc","Pellicola","Dischetto","Cerchio pieno","iOS","Android","iMessage","Cerchio con cornice","Quadrato","Astuccio","Inclinato","Pila","Poster","Polaroid","Cartuccia","Cartuccia 2","Francobollo","Biglietto"]]

struct Settings {
 var zoom = 1.0, rotation = 0.0, x = 0.0, y = 0.0, textSize = 120.0
 var fill = true, transparent = true, mirror = false
 var background = NSColor.white
 var text = ""
}

func render(_ source: NSImage, style: String, settings s: Settings) -> NSImage {
 let bitmap = NSBitmapImageRep(bitmapDataPlanes:nil, pixelsWide:1024, pixelsHigh:1024, bitsPerSample:8, samplesPerPixel:4, hasAlpha:true, isPlanar:false, colorSpaceName:.deviceRGB, bytesPerRow:0, bitsPerPixel:0)!
 NSGraphicsContext.saveGraphicsState()
 NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep:bitmap)
 NSGraphicsContext.current?.imageInterpolation = .high
 func box(_ r: NSRect, _ color: NSColor, _ radius: CGFloat = 0) {
  color.setFill(); NSBezierPath(roundedRect:r, xRadius:radius, yRadius:radius).fill()
 }
 func mediaColor(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat=1)->NSColor { NSColor(calibratedRed:r,green:g,blue:b,alpha:a) }
 func mediaMaterial(_ path:NSBezierPath,_ colors:[NSColor],angle:CGFloat=90,shadow:Bool=false) {
  NSGraphicsContext.saveGraphicsState()
  if shadow { let sh=NSShadow(); sh.shadowColor=NSColor.black.withAlphaComponent(0.31); sh.shadowOffset=NSSize(width:0,height:-12); sh.shadowBlurRadius=24; sh.set(); colors[0].setFill(); path.fill(); NSShadow().set() }
  NSGradient(colors:colors)!.draw(in:path,angle:angle); NSGraphicsContext.restoreGraphicsState()
 }
 func mediaStroke(_ path:NSBezierPath,_ color:NSColor,_ width:CGFloat=2) { color.setStroke(); path.lineWidth=width; path.stroke() }
 func mediaRing(_ rect:NSRect,_ color:NSColor,_ width:CGFloat=2) { mediaStroke(NSBezierPath(ovalIn:rect),color,width) }
 func mediaSheen(_ rect:NSRect,radius:CGFloat=0,oval:Bool=false,opacity:CGFloat=0.16) {
  NSGraphicsContext.saveGraphicsState()
  (oval ? NSBezierPath(ovalIn:rect) : NSBezierPath(roundedRect:rect,xRadius:radius,yRadius:radius)).addClip()
  let p=NSBezierPath(); p.move(to:NSPoint(x:rect.minX,y:rect.maxY)); p.line(to:NSPoint(x:rect.maxX,y:rect.maxY)); p.line(to:NSPoint(x:rect.maxX,y:rect.minY+rect.height*0.60)); p.line(to:NSPoint(x:rect.minX,y:rect.minY+rect.height*0.22)); p.close()
  NSGradient(starting:NSColor.white.withAlphaComponent(0.01),ending:NSColor.white.withAlphaComponent(opacity))!.draw(in:p,angle:90)
  NSGraphicsContext.restoreGraphicsState()
 }
 func picture(_ r: NSRect, radius: CGFloat = 0, oval: Bool = false) {
  NSGraphicsContext.saveGraphicsState()
  (oval ? NSBezierPath(ovalIn:r) : NSBezierPath(roundedRect:r,xRadius:radius,yRadius:radius)).addClip()
  if !s.transparent { box(r,s.background) }
  let transform = AffineTransform(translationByX:r.midX + s.x*450, byY:r.midY+s.y*450)
  (transform as NSAffineTransform).concat()
  let rot = NSAffineTransform(); rot.rotate(byDegrees:s.rotation); rot.scaleX(by:s.mirror ? -1 : 1, yBy:1); rot.concat()
  let f = (s.fill ? max(r.width/source.size.width,r.height/source.size.height) : min(r.width/source.size.width,r.height/source.size.height))*s.zoom
  let z = NSSize(width:source.size.width*f,height:source.size.height*f)
  source.draw(in:NSRect(x:-z.width/2,y:-z.height/2,width:z.width,height:z.height),from:.zero,operation:.sourceOver,fraction:1)
  NSGraphicsContext.restoreGraphicsState()
 }
 if !s.transparent { box(NSRect(x:0,y:0,width:1024,height:1024), s.background) }
 switch style {
 case "Folder Full", "Folder Center", "Dark Folder":
  // Apple-style folder: shaped rear tab, inset paper, bevelled front and soft shadow.
  let dark = style == "Dark Folder"
  func tint(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat)->NSColor { NSColor(calibratedRed:r,green:g,blue:b,alpha:1) }
  func gradient(_ path:NSBezierPath,_ top:NSColor,_ bottom:NSColor) {
   NSGradient(starting:bottom,ending:top)!.draw(in:path,angle:90)
  }
  let back=NSBezierPath()
  back.move(to:NSPoint(x:96,y:202))
  back.line(to:NSPoint(x:96,y:786))
  back.curve(to:NSPoint(x:148,y:838),controlPoint1:NSPoint(x:96,y:820),controlPoint2:NSPoint(x:114,y:838))
  back.line(to:NSPoint(x:338,y:838))
  back.curve(to:NSPoint(x:374,y:823),controlPoint1:NSPoint(x:355,y:838),controlPoint2:NSPoint(x:363,y:835))
  back.line(to:NSPoint(x:409,y:786))
  back.curve(to:NSPoint(x:445,y:770),controlPoint1:NSPoint(x:420,y:774),controlPoint2:NSPoint(x:429,y:770))
  back.line(to:NSPoint(x:876,y:770))
  back.curve(to:NSPoint(x:928,y:718),controlPoint1:NSPoint(x:910,y:770),controlPoint2:NSPoint(x:928,y:752))
  back.line(to:NSPoint(x:928,y:202)); back.close()
  NSGraphicsContext.saveGraphicsState()
  let shadow=NSShadow(); shadow.shadowColor=NSColor.black.withAlphaComponent(dark ? 0.48 : 0.32); shadow.shadowOffset=NSSize(width:0,height:-14); shadow.shadowBlurRadius=30; shadow.set()
  NSColor(calibratedWhite:0.3,alpha:1).setFill(); back.fill()
  gradient(back,dark ? tint(0.28,0.48,0.60) : tint(0.37,0.76,0.89),dark ? tint(0.12,0.28,0.38) : tint(0.17,0.56,0.72))
  NSGraphicsContext.restoreGraphicsState()
  // The pale rim remains visible above the front, as on the supplied reference.
  let paper=NSBezierPath(roundedRect:NSRect(x:124,y:650,width:776,height:92),xRadius:30,yRadius:30)
  gradient(paper,dark ? tint(0.76,0.83,0.86) : .white,dark ? tint(0.46,0.59,0.65) : tint(0.82,0.93,0.97))
  let front=NSBezierPath(roundedRect:NSRect(x:96,y:166,width:832,height:548),xRadius:40,yRadius:40)
  NSGraphicsContext.saveGraphicsState()
  let frontShadow=NSShadow(); frontShadow.shadowColor=NSColor.black.withAlphaComponent(0.18); frontShadow.shadowOffset=NSSize(width:0,height:-5); frontShadow.shadowBlurRadius=9; frontShadow.set()
  NSColor(calibratedWhite:0.3,alpha:1).setFill(); front.fill()
  gradient(front,dark ? tint(0.25,0.45,0.57) : tint(0.43,0.81,0.94),dark ? tint(0.13,0.30,0.41) : tint(0.25,0.66,0.83))
  NSGraphicsContext.restoreGraphicsState()
  if style == "Folder Full" {
   picture(NSRect(x:102,y:173,width:820,height:534),radius:34)
   NSGraphicsContext.saveGraphicsState(); front.addClip()
   NSGradient(starting:NSColor.white.withAlphaComponent(0),ending:NSColor.white.withAlphaComponent(0.15))!.draw(in:NSRect(x:96,y:166,width:832,height:548),angle:90)
   NSGraphicsContext.restoreGraphicsState()
  } else { picture(NSRect(x:306,y:252,width:412,height:350),radius:20) }
  // Fine top highlight and lower bevel keep the silhouette legible at small sizes.
  let highlight=NSBezierPath(); highlight.move(to:NSPoint(x:136,y:707)); highlight.line(to:NSPoint(x:888,y:707)); highlight.lineWidth=5; NSColor.white.withAlphaComponent(dark ? 0.23 : 0.55).setStroke(); highlight.stroke()
  let bottom=NSBezierPath(); bottom.move(to:NSPoint(x:136,y:173)); bottom.line(to:NSPoint(x:888,y:173)); bottom.lineWidth=4; NSColor.black.withAlphaComponent(0.10).setStroke(); bottom.stroke()

 case "macOS App", "iOS", "Android", "iMessage", "Square":
  let r = style == "iMessage" ? NSRect(x:50,y:155,width:924,height:714) : NSRect(x:72,y:72,width:880,height:880)
  if style == "macOS App" { box(r,.white,195); picture(r.insetBy(dx:30,dy:30),radius:168) }
  else { picture(r,radius:style == "Square" ? 0 : style == "Android" ? 440 : 195) }
 case "Circle Full", "Circle Frame":
  if style == "Circle Frame" { box(NSRect(x:52,y:52,width:920,height:920),.white,460) }
  picture(NSRect(x:style == "Circle Full" ? 40 : 92,y:style == "Circle Full" ? 40 : 92,width:style == "Circle Full" ? 944 : 840,height:style == "Circle Full" ? 944 : 840),oval:true)
 case "USB":
  func metal(_ path:NSBezierPath, colors:[NSColor], angle:CGFloat=0, shadow:Bool=false) {
   NSGraphicsContext.saveGraphicsState()
   if shadow { let sh=NSShadow(); sh.shadowColor=NSColor.black.withAlphaComponent(0.30); sh.shadowOffset=NSSize(width:0,height:-12); sh.shadowBlurRadius=24; sh.set(); NSColor.gray.setFill(); path.fill(); NSShadow().set() }
   NSGradient(colors:colors)!.draw(in:path,angle:angle)
   NSGraphicsContext.restoreGraphicsState()
  }
  func gray(_ white:CGFloat)->NSColor { NSColor(calibratedWhite:white,alpha:1) }
  // Satin metal plug, recessed dark apertures and an inset blue contact tongue.
  let plug=NSBezierPath(roundedRect:NSRect(x:349,y:710,width:326,height:236),xRadius:22,yRadius:22)
  metal(plug,colors:[gray(0.49),gray(0.89),gray(0.98),gray(0.73),gray(0.47)],shadow:true)
  gray(0.40).setStroke(); plug.lineWidth=3; plug.stroke()
  box(NSRect(x:365,y:927,width:294,height:8),gray(0.97),4)
  for x in [391,553] {
   box(NSRect(x:x,y:817,width:80,height:63),gray(0.37),9)
   box(NSRect(x:x+4,y:821,width:72,height:55),gray(0.13),7)
   box(NSRect(x:x+8,y:822,width:64,height:9),gray(0.55),3)
  }
  box(NSRect(x:369,y:726,width:286,height:28),NSColor(calibratedRed:0.07,green:0.29,blue:0.46,alpha:1),5)
  // Rounded aluminium shell with a narrow dark seam and soft edge highlights.
  let body=NSBezierPath(roundedRect:NSRect(x:284,y:112,width:456,height:648),xRadius:78,yRadius:78)
  metal(body,colors:[gray(0.42),gray(0.77),gray(0.96),gray(0.84),gray(0.59)],shadow:true)
  gray(0.46).setStroke(); body.lineWidth=3; body.stroke()
  let inset=NSBezierPath(roundedRect:NSRect(x:300,y:127,width:424,height:618),xRadius:65,yRadius:65)
  NSColor.white.withAlphaComponent(0.5).setStroke(); inset.lineWidth=3; inset.stroke()
  box(NSRect(x:309,y:707,width:406,height:14),gray(0.20),7)
  box(NSRect(x:315,y:699,width:394,height:5),NSColor.white.withAlphaComponent(0.75),2)
  // The imported picture sits in a recessed label rather than covering the hardware.
  box(NSRect(x:326,y:239,width:372,height:416),gray(0.42),35)
  box(NSRect(x:330,y:243,width:364,height:408),gray(0.94),32)
  picture(NSRect(x:338,y:251,width:348,height:392),radius:26)
  NSGraphicsContext.saveGraphicsState()
  NSBezierPath(roundedRect:NSRect(x:338,y:251,width:348,height:392),xRadius:26,yRadius:26).addClip()
  NSGradient(starting:NSColor.white.withAlphaComponent(0),ending:NSColor.white.withAlphaComponent(0.15))!.draw(in:NSRect(x:338,y:251,width:348,height:392),angle:70)
  NSGraphicsContext.restoreGraphicsState()
  // A recessed lanyard slot and a small status light finish the lower end.
  box(NSRect(x:437,y:158,width:150,height:36),gray(0.48),18)
  box(NSRect(x:443,y:165,width:138,height:23),gray(0.18),12)
  box(NSRect(x:445,y:164,width:134,height:6),gray(0.83),3)
  box(NSRect(x:500,y:675,width:24,height:9),NSColor(calibratedRed:0.20,green:0.75,blue:0.86,alpha:1),5)
 case "SD Card":
  func shade(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat)->NSColor { NSColor(calibratedRed:r,green:g,blue:b,alpha:1) }
  let card=NSBezierPath()
  card.move(to:NSPoint(x:250,y:91)); card.line(to:NSPoint(x:774,y:91))
  card.curve(to:NSPoint(x:806,y:123),controlPoint1:NSPoint(x:795,y:91),controlPoint2:NSPoint(x:806,y:102))
  card.line(to:NSPoint(x:806,y:786)); card.line(to:NSPoint(x:662,y:930)); card.line(to:NSPoint(x:250,y:930))
  card.curve(to:NSPoint(x:218,y:898),controlPoint1:NSPoint(x:229,y:930),controlPoint2:NSPoint(x:218,y:919))
  card.line(to:NSPoint(x:218,y:738)); card.line(to:NSPoint(x:230,y:738)); card.line(to:NSPoint(x:230,y:633)); card.line(to:NSPoint(x:218,y:633)); card.line(to:NSPoint(x:218,y:123))
  card.curve(to:NSPoint(x:250,y:91),controlPoint1:NSPoint(x:218,y:102),controlPoint2:NSPoint(x:229,y:91)); card.close()
  NSGraphicsContext.saveGraphicsState()
  let shadow=NSShadow(); shadow.shadowColor=NSColor.black.withAlphaComponent(0.34); shadow.shadowOffset=NSSize(width:0,height:-12); shadow.shadowBlurRadius=25; shadow.set(); shade(0.12,0.15,0.19).setFill(); card.fill(); NSShadow().set()
  NSGradient(colors:[shade(0.12,0.15,0.19),shade(0.23,0.27,0.32),shade(0.11,0.14,0.18)])!.draw(in:card,angle:90)
  NSGraphicsContext.restoreGraphicsState()
  shade(0.35,0.40,0.46).setStroke(); card.lineWidth=3; card.stroke()
  // Shallow moulded contour follows the chamfered top edge.
  let rim=NSBezierPath(); rim.move(to:NSPoint(x:238,y:151)); rim.line(to:NSPoint(x:238,y:888)); rim.curve(to:NSPoint(x:260,y:910),controlPoint1:NSPoint(x:238,y:904),controlPoint2:NSPoint(x:244,y:910)); rim.line(to:NSPoint(x:650,y:910)); rim.line(to:NSPoint(x:786,y:774)); rim.line(to:NSPoint(x:786,y:151)); rim.lineWidth=4; NSColor.white.withAlphaComponent(0.16).setStroke(); rim.stroke()
  // Individual gold-plated contact pads sit in a dark recessed connector bed.
  box(NSRect(x:260,y:732,width:440,height:156),shade(0.07,0.09,0.12),14)
  for i in 0..<9 {
   let x=CGFloat(271+i*47), height:CGFloat = i == 0 || i == 8 ? 112 : 126
   let pad=NSBezierPath(roundedRect:NSRect(x:x,y:746,width:32,height:height),xRadius:7,yRadius:7)
   NSGradient(colors:[shade(0.51,0.32,0.08),shade(0.88,0.68,0.26),shade(1.0,0.88,0.53),shade(0.71,0.49,0.15)])!.draw(in:pad,angle:0)
   box(NSRect(x:x+5,y:750,width:3,height:height-10),NSColor.white.withAlphaComponent(0.23),1)
  }
  // Side write-protect slider with a small metallic latch.
  box(NSRect(x:219,y:650,width:22,height:69),shade(0.05,0.07,0.09),6)
  let latch=NSBezierPath(roundedRect:NSRect(x:220,y:677,width:19,height:33),xRadius:4,yRadius:4)
  NSGradient(starting:shade(0.49,0.53,0.58),ending:shade(0.87,0.89,0.91))!.draw(in:latch,angle:0)
  // Recessed picture label, satin surface and lower grip ribs.
  box(NSRect(x:264,y:211,width:496,height:473),shade(0.05,0.07,0.09),30)
  box(NSRect(x:269,y:216,width:486,height:463),shade(0.62,0.65,0.68),26)
  picture(NSRect(x:277,y:224,width:470,height:447),radius:20)
  NSGraphicsContext.saveGraphicsState(); NSBezierPath(roundedRect:NSRect(x:277,y:224,width:470,height:447),xRadius:20,yRadius:20).addClip()
  NSGradient(starting:NSColor.white.withAlphaComponent(0),ending:NSColor.white.withAlphaComponent(0.10))!.draw(in:NSRect(x:277,y:224,width:470,height:447),angle:75); NSGraphicsContext.restoreGraphicsState()
  for y in [130,148,166] { box(NSRect(x:282,y:y,width:460,height:5),NSColor.black.withAlphaComponent(0.24),2); box(NSRect(x:282,y:y+5,width:460,height:2),NSColor.white.withAlphaComponent(0.08),1) }
 case "Drive", "Silver Drive":
  let r=NSRect(x:135,y:140,width:754,height:730)
  box(r,style == "Drive" ? .darkGray : .lightGray,55)
  picture(NSRect(x:r.minX+35,y:r.minY+100,width:r.width-70,height:r.height-210),radius:20)
  box(NSRect(x:r.maxX-75,y:r.minY+35,width:22,height:22),.systemGreen,11)
 case "CD Disc":
  // Polished polycarbonate rim, printable disc face and a real transparent spindle hole.
  let disc=NSRect(x:66,y:66,width:892,height:892)
  mediaMaterial(NSBezierPath(ovalIn:disc),[mediaColor(0.47,0.52,0.61),mediaColor(0.83,0.88,0.91),mediaColor(0.99,0.98,0.94),mediaColor(0.75,0.82,0.86),mediaColor(0.48,0.54,0.63)],angle:35,shadow:true)
  mediaRing(disc.insetBy(dx:4,dy:4),NSColor.white.withAlphaComponent(0.8),3)
  let face=disc.insetBy(dx:19,dy:19)
  picture(face,oval:true)
  mediaSheen(face,oval:true,opacity:0.24)
  mediaRing(face,mediaColor(0.37,0.43,0.50,0.6),2)
  // Fine concentric rings remain visible around the hub and the edge.
  for inset in [7,11] { mediaRing(disc.insetBy(dx:CGFloat(inset),dy:CGFloat(inset)),NSColor.black.withAlphaComponent(0.10),1) }
  let hub=NSRect(x:405,y:405,width:214,height:214)
  mediaMaterial(NSBezierPath(ovalIn:hub),[mediaColor(0.55,0.61,0.65),mediaColor(0.90,0.94,0.94),mediaColor(0.72,0.78,0.82),mediaColor(0.96,0.97,0.95)],angle:40)
  mediaRing(hub,NSColor.white.withAlphaComponent(0.8),3)
  mediaRing(hub.insetBy(dx:12,dy:12),mediaColor(0.40,0.47,0.52,0.6),2)
  mediaRing(NSRect(x:458,y:458,width:108,height:108),mediaColor(0.40,0.45,0.51),7)
  NSGraphicsContext.saveGraphicsState(); let clearContext=NSGraphicsContext.current!.cgContext; clearContext.setBlendMode(.clear); clearContext.fillEllipse(in:CGRect(x:466,y:466,width:92,height:92)); NSGraphicsContext.restoreGraphicsState()
 case "CD Sleeve":
  // The disc peeks above the paper sleeve; a semicircular notch exposes its edge.
  let disc=NSRect(x:188,y:310,width:648,height:648)
  mediaMaterial(NSBezierPath(ovalIn:disc),[mediaColor(0.55,0.61,0.70),mediaColor(0.96,0.97,0.96),mediaColor(0.75,0.85,0.87),mediaColor(0.96,0.92,0.97)],angle:30,shadow:true)
  mediaRing(disc.insetBy(dx:6,dy:6),NSColor.white.withAlphaComponent(0.8),3)
  let paper=NSBezierPath()
  paper.move(to:NSPoint(x:121,y:104));paper.line(to:NSPoint(x:903,y:104));paper.curve(to:NSPoint(x:920,y:121),controlPoint1:NSPoint(x:914,y:104),controlPoint2:NSPoint(x:920,y:110));paper.line(to:NSPoint(x:920,y:877));paper.curve(to:NSPoint(x:903,y:894),controlPoint1:NSPoint(x:920,y:888),controlPoint2:NSPoint(x:914,y:894));paper.line(to:NSPoint(x:564,y:894))
  paper.curve(to:NSPoint(x:512,y:842),controlPoint1:NSPoint(x:564,y:865),controlPoint2:NSPoint(x:541,y:842));paper.curve(to:NSPoint(x:460,y:894),controlPoint1:NSPoint(x:483,y:842),controlPoint2:NSPoint(x:460,y:865));paper.line(to:NSPoint(x:121,y:894));paper.curve(to:NSPoint(x:104,y:877),controlPoint1:NSPoint(x:110,y:894),controlPoint2:NSPoint(x:104,y:888));paper.line(to:NSPoint(x:104,y:121));paper.curve(to:NSPoint(x:121,y:104),controlPoint1:NSPoint(x:104,y:110),controlPoint2:NSPoint(x:110,y:104));paper.close()

  mediaMaterial(paper,[mediaColor(0.79,0.78,0.74),mediaColor(0.96,0.95,0.91),mediaColor(1,0.995,0.97)],shadow:true)
  mediaStroke(paper,mediaColor(0.63,0.64,0.63,0.65),2)
  NSGraphicsContext.saveGraphicsState();paper.addClip()
  let art=NSRect(x:128,y:129,width:768,height:740)
  picture(art,radius:7)
  mediaSheen(art,radius:7,opacity:0.09)
  // Folded seams and a narrow bottom bevel make the sleeve read as paper.
  box(NSRect(x:113,y:126,width:4,height:735),NSColor.black.withAlphaComponent(0.09),2)
  box(NSRect(x:119,y:126,width:2,height:735),NSColor.white.withAlphaComponent(0.65),1)
  box(NSRect(x:132,y:113,width:760,height:3),NSColor.black.withAlphaComponent(0.12),1)
  NSGraphicsContext.restoreGraphicsState()
 case "MiniDisc":
  let shell=NSBezierPath(roundedRect:NSRect(x:116,y:132,width:792,height:760),xRadius:35,yRadius:35)
  mediaMaterial(shell,[mediaColor(0.25,0.36,0.44),mediaColor(0.62,0.76,0.82),mediaColor(0.86,0.93,0.95),mediaColor(0.44,0.61,0.69)],angle:20,shadow:true)
  mediaStroke(shell,mediaColor(0.35,0.47,0.54),3)
  let inset=NSBezierPath(roundedRect:NSRect(x:132,y:148,width:760,height:728),xRadius:24,yRadius:24)
  mediaStroke(inset,NSColor.white.withAlphaComponent(0.72),3)
  // A small optical disc remains visible under the clear cartridge and shutter.
  let disc=NSRect(x:196,y:210,width:612,height:612)
  mediaMaterial(NSBezierPath(ovalIn:disc),[mediaColor(0.56,0.64,0.70),mediaColor(0.96,0.97,0.96),mediaColor(0.68,0.79,0.82),mediaColor(0.89,0.85,0.94)],angle:30)
  picture(disc.insetBy(dx:18,dy:18),oval:true)
  mediaSheen(disc,oval:true,opacity:0.23)
  mediaRing(disc,NSColor.white.withAlphaComponent(0.75),3)
  mediaMaterial(NSBezierPath(ovalIn:NSRect(x:448,y:452,width:108,height:108)),[mediaColor(0.39,0.48,0.54),mediaColor(0.92,0.95,0.95),mediaColor(0.55,0.65,0.69)],angle:20)
  box(NSRect(x:483,y:487,width:38,height:38),mediaColor(0.20,0.27,0.32),19)
  let shutter=NSBezierPath(roundedRect:NSRect(x:668,y:159,width:196,height:706),xRadius:14,yRadius:14)
  mediaMaterial(shutter,[mediaColor(0.42,0.48,0.53),mediaColor(0.90,0.93,0.94),mediaColor(0.70,0.75,0.78),mediaColor(0.40,0.47,0.52)],angle:0)
  mediaStroke(shutter,mediaColor(0.29,0.37,0.43),2)
  box(NSRect(x:679,y:181,width:3,height:661),NSColor.white.withAlphaComponent(0.65),1)
  box(NSRect(x:716,y:357,width:104,height:266),mediaColor(0.25,0.33,0.39),12)
  mediaMaterial(NSBezierPath(roundedRect:NSRect(x:723,y:364,width:90,height:252),xRadius:7,yRadius:7),[mediaColor(0.55,0.63,0.67),mediaColor(0.85,0.90,0.90),mediaColor(0.40,0.49,0.55)],angle:45)
  for x in [157,860] { box(NSRect(x:x,y:168,width:12,height:12),mediaColor(0.23,0.35,0.42),6) }
  box(NSRect(x:161,y:850,width:210,height:5),NSColor.white.withAlphaComponent(0.72),2)
 case "Vinyl":
  let r=NSRect(x:60,y:60,width:904,height:904)
  NSGraphicsContext.saveGraphicsState(); NSBezierPath(ovalIn:r).addClip();box(r,.black)
  picture(NSRect(x:315,y:315,width:394,height:394),oval:true)
  for i in stride(from:450,through:870,by:24) { mediaRing(NSRect(x:(1024-i)/2,y:(1024-i)/2,width:i,height:i),NSColor(white:0.2,alpha:1),2) }
  NSGraphicsContext.current?.compositingOperation = .copy;box(NSRect(x:467,y:467,width:90,height:90),.clear,45);NSGraphicsContext.restoreGraphicsState()
 case "Document Full", "Document Center", "Booklet", "Poster", "Polaroid":
  let pol = style == "Polaroid"
  let r = NSRect(x:180,y:70,width:664,height:884)
  box(r,.white,style == "Stamp" ? 0 : 18)
  picture(style == "Document Center" ? NSRect(x:270,y:270,width:484,height:440) : NSRect(x:r.minX+30,y:r.minY+(pol ? 140 : 30),width:r.width-60,height:r.height-(pol ? 170 : 60)),radius:4)
  if style.hasPrefix("Document") {
   let fold=NSBezierPath(); fold.move(to:NSPoint(x:r.maxX-110,y:r.maxY)); fold.line(to:NSPoint(x:r.maxX-110,y:r.maxY-110)); fold.line(to:NSPoint(x:r.maxX,y:r.maxY-110)); fold.close(); NSColor.lightGray.setFill(); fold.fill()
  }
  if style == "Booklet" { box(NSRect(x:180,y:70,width:35,height:884),.darkGray,8) }
 case "Film":
  // Perforations are punched through the emulsion, with transparent interiors.
  let strip=NSBezierPath(roundedRect:NSRect(x:54,y:180,width:916,height:664),xRadius:22,yRadius:22)
  for i in 0..<12 { for y in [207,769] { strip.append(NSBezierPath(roundedRect:NSRect(x:82+i*74,y:y,width:43,height:48),xRadius:7,yRadius:7)) } }
  strip.windingRule = .evenOdd
  mediaMaterial(strip,[mediaColor(0.055,0.043,0.035),mediaColor(0.18,0.15,0.12),mediaColor(0.045,0.04,0.036)],shadow:true)
  mediaStroke(strip,mediaColor(0.30,0.25,0.19,0.75),2)
  let art=NSRect(x:107,y:284,width:810,height:456)
  box(art.insetBy(dx:-8,dy:-8),mediaColor(0.035,0.028,0.02),7)
  mediaMaterial(NSBezierPath(rect:art),[mediaColor(0.31,0.25,0.17),mediaColor(0.58,0.47,0.31)],angle:90)
  picture(art,radius:3)
  mediaSheen(art,radius:3,opacity:0.12)
  mediaStroke(NSBezierPath(roundedRect:art.insetBy(dx:-3,dy:-3),xRadius:4,yRadius:4),mediaColor(0.66,0.53,0.34,0.55),2)
  for y in [190,832] { box(NSRect(x:88,y:y,width:848,height:2),NSColor.white.withAlphaComponent(0.16),1) }
  for x in [69,949] { box(NSRect(x:x,y:329,width:4,height:363),NSColor.white.withAlphaComponent(0.10),2) }
  NSGraphicsContext.saveGraphicsState(); let clearContext=NSGraphicsContext.current!.cgContext; clearContext.setBlendMode(.clear)
  for i in 0..<12 { for y in [207,769] { clearContext.addPath(CGPath(roundedRect:CGRect(x:82+i*74,y:y,width:43,height:48),cornerWidth:7,cornerHeight:7,transform:nil)); clearContext.fillPath() } }
  NSGraphicsContext.restoreGraphicsState()
 case "Floppy":
  let shell=NSBezierPath()
  shell.move(to:NSPoint(x:154,y:94));shell.line(to:NSPoint(x:870,y:94));shell.curve(to:NSPoint(x:902,y:126),controlPoint1:NSPoint(x:891,y:94),controlPoint2:NSPoint(x:902,y:105));shell.line(to:NSPoint(x:902,y:872));shell.line(to:NSPoint(x:844,y:930));shell.line(to:NSPoint(x:154,y:930));shell.curve(to:NSPoint(x:122,y:898),controlPoint1:NSPoint(x:133,y:930),controlPoint2:NSPoint(x:122,y:919));shell.line(to:NSPoint(x:122,y:126));shell.curve(to:NSPoint(x:154,y:94),controlPoint1:NSPoint(x:122,y:105),controlPoint2:NSPoint(x:133,y:94));shell.close()
  mediaMaterial(shell,[mediaColor(0.075,0.10,0.14),mediaColor(0.21,0.26,0.32),mediaColor(0.11,0.145,0.19)],shadow:true)
  mediaStroke(shell,mediaColor(0.34,0.39,0.44),3)
  let inset=NSBezierPath(roundedRect:NSRect(x:140,y:112,width:744,height:782),xRadius:18,yRadius:18)
  mediaStroke(inset,NSColor.white.withAlphaComponent(0.13),3)
  // Stamped steel shutter with the dark rectangular read/write aperture.
  box(NSRect(x:273,y:646,width:476,height:279),mediaColor(0.055,0.07,0.09),12)
  let shutter=NSBezierPath(roundedRect:NSRect(x:302,y:658,width:419,height:268),xRadius:11,yRadius:11)
  mediaMaterial(shutter,[mediaColor(0.43,0.47,0.51),mediaColor(0.91,0.93,0.94),mediaColor(0.76,0.79,0.82),mediaColor(0.49,0.54,0.58)],angle:0)
  mediaStroke(shutter,mediaColor(0.35,0.40,0.45),2)
  box(NSRect(x:315,y:910,width:390,height:4),NSColor.white.withAlphaComponent(0.75),2)
  box(NSRect(x:565,y:715,width:106,height:174),mediaColor(0.19,0.23,0.27),6)
  box(NSRect(x:572,y:722,width:92,height:160),mediaColor(0.055,0.07,0.09),4)
  box(NSRect(x:574,y:723,width:88,height:8),mediaColor(0.48,0.53,0.58),2)
  // Paper label is recessed into the moulded plastic front.
  box(NSRect(x:194,y:222,width:636,height:386),mediaColor(0.04,0.055,0.075),16)
  mediaMaterial(NSBezierPath(roundedRect:NSRect(x:202,y:230,width:620,height:370),xRadius:10,yRadius:10),[mediaColor(0.76,0.78,0.78),mediaColor(0.97,0.97,0.94)])
  picture(NSRect(x:213,y:241,width:598,height:348),radius:6)
  mediaSheen(NSRect(x:213,y:241,width:598,height:348),radius:6,opacity:0.09)
  for x in [158,826] {
   box(NSRect(x:x,y:132,width:40,height:49),mediaColor(0.035,0.05,0.07),5)
   box(NSRect(x:x+5,y:137,width:30,height:8),mediaColor(0.40,0.45,0.50),2)
  }
  for y in [183,194] { box(NSRect(x:227,y:y,width:570,height:3),NSColor.black.withAlphaComponent(0.27),1);box(NSRect(x:227,y:y+3,width:570,height:2),NSColor.white.withAlphaComponent(0.10),1) }
 case "Cartridge":
  // Tall console cartridge: moulded shell, vertical grip ribs and recessed game label.
  let shell=NSBezierPath()
  shell.move(to:NSPoint(x:154,y:94));shell.line(to:NSPoint(x:870,y:94));shell.curve(to:NSPoint(x:892,y:116),controlPoint1:NSPoint(x:884,y:94),controlPoint2:NSPoint(x:892,y:102));shell.line(to:NSPoint(x:892,y:870));shell.line(to:NSPoint(x:848,y:914));shell.line(to:NSPoint(x:176,y:914));shell.line(to:NSPoint(x:132,y:870));shell.line(to:NSPoint(x:132,y:116));shell.curve(to:NSPoint(x:154,y:94),controlPoint1:NSPoint(x:132,y:102),controlPoint2:NSPoint(x:140,y:94));shell.close()
  mediaMaterial(shell,[mediaColor(0.42,0.45,0.48),mediaColor(0.72,0.74,0.75),mediaColor(0.86,0.87,0.87),mediaColor(0.63,0.66,0.68)],angle:15,shadow:true)
  mediaStroke(shell,mediaColor(0.39,0.43,0.46),3)
  box(NSRect(x:152,y:131,width:5,height:729),NSColor.white.withAlphaComponent(0.46),2)
  box(NSRect(x:869,y:133,width:4,height:725),NSColor.black.withAlphaComponent(0.18),2)
  let grip=NSBezierPath(roundedRect:NSRect(x:163,y:224,width:133,height:628),xRadius:14,yRadius:14)
  mediaMaterial(grip,[mediaColor(0.53,0.56,0.58),mediaColor(0.74,0.76,0.77)],angle:0)
  for x in stride(from:176,through:279,by:17) {
   box(NSRect(x:x,y:240,width:6,height:592),NSColor.black.withAlphaComponent(0.19),3)
   box(NSRect(x:x+6,y:240,width:3,height:592),NSColor.white.withAlphaComponent(0.45),1)
  }
  box(NSRect(x:321,y:227,width:521,height:637),mediaColor(0.30,0.34,0.37),16)
  mediaMaterial(NSBezierPath(roundedRect:NSRect(x:328,y:234,width:507,height:623),xRadius:11,yRadius:11),[mediaColor(0.74,0.76,0.76),mediaColor(0.96,0.96,0.92)])
  picture(NSRect(x:339,y:245,width:485,height:601),radius:6)
  mediaSheen(NSRect(x:339,y:245,width:485,height:601),radius:6,opacity:0.10)
  // Upper mould seam, connector mouth, gold fingers and recessed screw heads.
  box(NSRect(x:195,y:881,width:632,height:5),NSColor.black.withAlphaComponent(0.14),2)
  box(NSRect(x:195,y:886,width:632,height:3),NSColor.white.withAlphaComponent(0.45),1)
  box(NSRect(x:262,y:99,width:502,height:74),mediaColor(0.20,0.24,0.27),9)
  box(NSRect(x:274,y:107,width:478,height:48),mediaColor(0.055,0.07,0.08),5)
  for i in 0..<17 { let pad=NSBezierPath(roundedRect:NSRect(x:286+i*27,y:112,width:16,height:29),xRadius:2,yRadius:2);mediaMaterial(pad,[mediaColor(0.49,0.34,0.10),mediaColor(0.90,0.74,0.37)],angle:0) }
  for x in [184,820] {
   box(NSRect(x:x,y:177,width:24,height:24),mediaColor(0.38,0.42,0.45),12)
   box(NSRect(x:x+4,y:181,width:16,height:16),mediaColor(0.67,0.70,0.71),8)
   box(NSRect(x:x+7,y:187,width:10,height:3),mediaColor(0.28,0.33,0.36),1)
  }
 case "Cartridge 2":
  // Compact handheld cartridge with a stepped corner and horizontal grip rails.
  let shell=NSBezierPath()
  shell.move(to:NSPoint(x:188,y:106));shell.line(to:NSPoint(x:836,y:106));shell.curve(to:NSPoint(x:860,y:130),controlPoint1:NSPoint(x:851,y:106),controlPoint2:NSPoint(x:860,y:115));shell.line(to:NSPoint(x:860,y:838));shell.line(to:NSPoint(x:798,y:900));shell.line(to:NSPoint(x:188,y:900));shell.curve(to:NSPoint(x:164,y:876),controlPoint1:NSPoint(x:173,y:900),controlPoint2:NSPoint(x:164,y:891));shell.line(to:NSPoint(x:164,y:130));shell.curve(to:NSPoint(x:188,y:106),controlPoint1:NSPoint(x:164,y:115),controlPoint2:NSPoint(x:173,y:106));shell.close()
  mediaMaterial(shell,[mediaColor(0.44,0.46,0.51),mediaColor(0.75,0.76,0.80),mediaColor(0.87,0.87,0.89),mediaColor(0.61,0.63,0.68)],angle:20,shadow:true)
  mediaStroke(shell,mediaColor(0.37,0.40,0.46),3)
  let top=NSBezierPath(roundedRect:NSRect(x:195,y:821,width:593,height:48),xRadius:17,yRadius:17)
  mediaMaterial(top,[mediaColor(0.50,0.52,0.58),mediaColor(0.80,0.81,0.85)],angle:90)
  for y in [771,788,805] { box(NSRect(x:211,y:y,width:578,height:5),NSColor.black.withAlphaComponent(0.18),2);box(NSRect(x:211,y:y+5,width:578,height:3),NSColor.white.withAlphaComponent(0.53),1) }
  box(NSRect(x:222,y:296,width:580,height:455),mediaColor(0.33,0.36,0.43),22)
  mediaMaterial(NSBezierPath(roundedRect:NSRect(x:229,y:303,width:566,height:441),xRadius:17,yRadius:17),[mediaColor(0.75,0.77,0.80),mediaColor(0.96,0.96,0.94)])
  picture(NSRect(x:241,y:315,width:542,height:417),radius:11)
  mediaSheen(NSRect(x:241,y:315,width:542,height:417),radius:11,opacity:0.10)
  for x in [185,832] { box(NSRect(x:x,y:198,width:5,height:491),NSColor.black.withAlphaComponent(0.14),2);box(NSRect(x:x+5,y:198,width:2,height:491),NSColor.white.withAlphaComponent(0.43),1) }
  let arrow=NSBezierPath();arrow.move(to:NSPoint(x:474,y:245));arrow.line(to:NSPoint(x:550,y:245));arrow.line(to:NSPoint(x:512,y:213));arrow.close();mediaColor(0.44,0.46,0.52).setFill();arrow.fill()
  mediaStroke(arrow,NSColor.white.withAlphaComponent(0.30),2)
  box(NSRect(x:290,y:111,width:444,height:56),mediaColor(0.29,0.32,0.38),7)
  box(NSRect(x:300,y:117,width:424,height:38),mediaColor(0.07,0.085,0.11),4)
  for i in 0..<15 { let pad=NSBezierPath(roundedRect:NSRect(x:311+i*27,y:121,width:15,height:24),xRadius:2,yRadius:2);mediaMaterial(pad,[mediaColor(0.50,0.35,0.11),mediaColor(0.91,0.75,0.39)],angle:0) }
 case "Stamp":
  // A continuous scalloped silhouette avoids square cut-outs and keeps every edge soft.
  let paper=NSBezierPath();paper.move(to:NSPoint(x:180,y:932))
  for x in stride(from:210,through:810,by:40) { paper.line(to:NSPoint(x:x-12,y:932));paper.appendArc(withCenter:NSPoint(x:x,y:932),radius:12,startAngle:180,endAngle:360,clockwise:false) }
  paper.line(to:NSPoint(x:844,y:932))
  for y in stride(from:900,through:140,by:-40) { paper.line(to:NSPoint(x:844,y:y+12));paper.appendArc(withCenter:NSPoint(x:844,y:y),radius:12,startAngle:90,endAngle:270,clockwise:false) }
  paper.line(to:NSPoint(x:844,y:92))
  for x in stride(from:810,through:210,by:-40) { paper.line(to:NSPoint(x:x+12,y:92));paper.appendArc(withCenter:NSPoint(x:x,y:92),radius:12,startAngle:0,endAngle:180,clockwise:false) }
  paper.line(to:NSPoint(x:180,y:92))
  for y in stride(from:140,through:900,by:40) { paper.line(to:NSPoint(x:180,y:y-12));paper.appendArc(withCenter:NSPoint(x:180,y:y),radius:12,startAngle:270,endAngle:90,clockwise:false) }
  paper.close()
  mediaMaterial(paper,[mediaColor(0.83,0.81,0.74),mediaColor(0.97,0.95,0.88),mediaColor(1,0.995,0.96)],shadow:true)
  mediaStroke(paper,mediaColor(0.62,0.61,0.56,0.55),1.5)
  NSGraphicsContext.saveGraphicsState();paper.addClip()
  for y in stride(from:111,through:916,by:9) { box(NSRect(x:194,y:y,width:636,height:1),mediaColor(0.44,0.40,0.29,0.025)) }
  let frame=NSRect(x:222,y:171,width:580,height:713)
  mediaStroke(NSBezierPath(rect:frame),mediaColor(0.29,0.43,0.47,0.6),3)
  mediaStroke(NSBezierPath(rect:frame.insetBy(dx:8,dy:8)),mediaColor(0.51,0.60,0.60,0.5),1)
  let art=NSRect(x:242,y:191,width:540,height:673)
  mediaMaterial(NSBezierPath(rect:art),[mediaColor(0.74,0.80,0.78),mediaColor(0.92,0.95,0.90)])
  picture(art,radius:1)
  mediaSheen(art,opacity:0.07)
  box(NSRect(x:240,y:144,width:544,height:2),mediaColor(0.36,0.46,0.45,0.28))
  NSGraphicsContext.restoreGraphicsState()
 case "VCard":
  // Landscape cotton-stock business card, photo panel and understated contact layout.
  let card=NSBezierPath(roundedRect:NSRect(x:70,y:249,width:884,height:526),xRadius:28,yRadius:28)
  mediaMaterial(card,[mediaColor(0.84,0.85,0.84),mediaColor(0.98,0.98,0.95),mediaColor(1,1,0.985)],shadow:true)
  mediaStroke(card,mediaColor(0.64,0.67,0.68,0.55),2)
  mediaStroke(NSBezierPath(roundedRect:NSRect(x:78,y:257,width:868,height:510),xRadius:21,yRadius:21),NSColor.white.withAlphaComponent(0.80),2)
  let photo=NSRect(x:107,y:287,width:306,height:450)
  box(photo.insetBy(dx:-3,dy:-3),mediaColor(0.69,0.74,0.75),18)
  mediaMaterial(NSBezierPath(roundedRect:photo,xRadius:15,yRadius:15),[mediaColor(0.58,0.72,0.76),mediaColor(0.80,0.88,0.89)])
  picture(photo,radius:15)
  mediaSheen(photo,radius:15,opacity:0.10)
  box(NSRect(x:447,y:300,width:2,height:424),mediaColor(0.31,0.42,0.47,0.13),1)
  box(NSRect(x:481,y:698,width:95,height:7),mediaColor(0.15,0.48,0.58),3)
  if s.text.isEmpty { box(NSRect(x:481,y:634,width:312,height:20),mediaColor(0.25,0.32,0.36),7);box(NSRect(x:481,y:598,width:216,height:9),mediaColor(0.48,0.54,0.56),4) }
  for (i,width) in [288,247,306].enumerated() {
   let y=CGFloat(501-i*68)
   box(NSRect(x:481,y:y-5,width:22,height:22),mediaColor(0.25,0.52,0.58,0.15),11)
   box(NSRect(x:488,y:y+2,width:8,height:8),mediaColor(0.19,0.44,0.51),4)
   box(NSRect(x:522,y:y+3,width:CGFloat(width),height:8),mediaColor(0.45,0.52,0.55,0.75),4)
  }
  box(NSRect(x:481,y:316,width:380,height:2),mediaColor(0.42,0.50,0.52,0.20),1)
 case "Tilted", "Stack":
  if style == "Stack" { box(NSRect(x:135,y:95,width:790,height:790),.gray,20); box(NSRect(x:100,y:130,width:790,height:790),.lightGray,20) }
  NSGraphicsContext.saveGraphicsState(); let t=NSAffineTransform(); t.translateX(by:512,yBy:512); t.rotate(byDegrees:-10); t.translateX(by:-512,yBy:-512); t.concat(); box(NSRect(x:155,y:155,width:714,height:714),.white,12); picture(NSRect(x:180,y:180,width:664,height:664),radius:4); NSGraphicsContext.restoreGraphicsState()
 case "DVD Case", "Blu-ray Case":
  let blu = style == "Blu-ray Case"
  func rgb(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ alpha:CGFloat=1)->NSColor { NSColor(calibratedRed:r,green:g,blue:b,alpha:alpha) }
  let outer=blu ? NSRect(x:196,y:116,width:632,height:792) : NSRect(x:226,y:76,width:572,height:872)
  let shell=NSBezierPath(roundedRect:outer,xRadius:32,yRadius:32)
  NSGraphicsContext.saveGraphicsState()
  let sh=NSShadow(); sh.shadowColor=NSColor.black.withAlphaComponent(0.36); sh.shadowOffset=NSSize(width:0,height:-12); sh.shadowBlurRadius=26; sh.set(); NSColor.darkGray.setFill(); shell.fill(); NSShadow().set()
  let colors=blu ? [rgb(0.02,0.12,0.40),rgb(0.07,0.42,0.81),rgb(0.12,0.56,0.97),rgb(0.03,0.24,0.61)] : [rgb(0.045,0.055,0.07),rgb(0.18,0.20,0.23),rgb(0.09,0.105,0.13),rgb(0.025,0.03,0.045)]
  NSGradient(colors:colors)!.draw(in:shell,angle:0)
  NSGraphicsContext.restoreGraphicsState()
  (blu ? rgb(0.18,0.43,0.68) : rgb(0.30,0.32,0.35)).setStroke(); shell.lineWidth=3; shell.stroke()
  // A rounded hinge and its fine grooves give the left edge physical thickness.
  let spine=NSBezierPath(roundedRect:NSRect(x:outer.minX+7,y:outer.minY+17,width:38,height:outer.height-34),xRadius:15,yRadius:15)
  NSGradient(colors:blu ? [rgb(0.02,0.11,0.34),rgb(0.20,0.50,0.86),rgb(0.04,0.22,0.52)] : [rgb(0.035,0.04,0.05),rgb(0.25,0.27,0.30),rgb(0.07,0.08,0.10)])!.draw(in:spine,angle:0)
  box(NSRect(x:outer.minX+46,y:outer.minY+27,width:3,height:outer.height-54),NSColor.black.withAlphaComponent(0.42),1)
  box(NSRect(x:outer.minX+51,y:outer.minY+30,width:2,height:outer.height-60),NSColor.white.withAlphaComponent(0.20),1)
  let art=NSRect(x:outer.minX+60,y:outer.minY+31,width:outer.width-87,height:outer.height-(blu ? 121 : 63))
  box(art.insetBy(dx:-5,dy:-5),NSColor.black.withAlphaComponent(0.60),9)
  let paper=NSBezierPath(roundedRect:art,xRadius:6,yRadius:6)
  NSGradient(starting:rgb(0.69,0.73,0.77),ending:rgb(0.90,0.92,0.94))!.draw(in:paper,angle:90)
  picture(art,radius:6)
  // A thin clear sleeve adds a soft diagonal reflection over the inserted cover.
  NSGraphicsContext.saveGraphicsState(); paper.addClip()
  let reflection=NSBezierPath(); reflection.move(to:NSPoint(x:art.minX,y:art.maxY)); reflection.line(to:NSPoint(x:art.maxX,y:art.maxY)); reflection.line(to:NSPoint(x:art.maxX,y:art.minY+art.height*0.70)); reflection.line(to:NSPoint(x:art.minX,y:art.minY+art.height*0.38)); reflection.close()
  NSGradient(starting:NSColor.white.withAlphaComponent(0.02),ending:NSColor.white.withAlphaComponent(0.14))!.draw(in:reflection,angle:90)
  NSGraphicsContext.restoreGraphicsState()
  // Bevels and the closure notch remain visible even on bright jacket art.
  box(NSRect(x:outer.minX+63,y:outer.maxY-13,width:outer.width-99,height:3),NSColor.white.withAlphaComponent(blu ? 0.45 : 0.28),1)
  box(NSRect(x:outer.minX+60,y:outer.minY+13,width:outer.width-89,height:3),NSColor.white.withAlphaComponent(0.15),1)
  box(NSRect(x:outer.maxX-13,y:outer.midY-45,width:6,height:90),NSColor.black.withAlphaComponent(0.46),3)
  box(NSRect(x:outer.maxX-8,y:outer.midY-38,width:2,height:76),NSColor.white.withAlphaComponent(0.20),1)
  if blu {
   // Translucent blue header and a small embossed disc motif.
   let header=NSBezierPath(roundedRect:NSRect(x:outer.minX+62,y:outer.maxY-78,width:outer.width-88,height:53),xRadius:12,yRadius:12)
   NSGradient(starting:rgb(0.03,0.24,0.61,0.6),ending:rgb(0.33,0.67,0.97,0.6))!.draw(in:header,angle:90)
   let emblem=NSBezierPath(ovalIn:NSRect(x:outer.midX-31,y:outer.maxY-64,width:62,height:24)); emblem.lineWidth=4; NSColor.white.withAlphaComponent(0.68).setStroke(); emblem.stroke()
   box(NSRect(x:outer.midX-5,y:outer.maxY-55,width:10,height:6),NSColor.white.withAlphaComponent(0.75),3)
  }
 case "CD Case":
  func glass(_ white:CGFloat,_ alpha:CGFloat=1)->NSColor { NSColor(calibratedWhite:white,alpha:alpha) }
  let outer=NSRect(x:72,y:120,width:880,height:784)
  let shell=NSBezierPath(roundedRect:outer,xRadius:23,yRadius:23)
  NSGraphicsContext.saveGraphicsState()
  let sh=NSShadow(); sh.shadowColor=NSColor.black.withAlphaComponent(0.30); sh.shadowOffset=NSSize(width:0,height:-12); sh.shadowBlurRadius=25; sh.set(); glass(0.51).setFill(); shell.fill(); NSShadow().set()
  NSGradient(colors:[glass(0.46),glass(0.89),glass(0.97),glass(0.74),glass(0.48)])!.draw(in:shell,angle:0)
  NSGraphicsContext.restoreGraphicsState()
  glass(0.48).setStroke(); shell.lineWidth=3; shell.stroke()
  // Transparent jewel-case rim surrounding the near-square album insert.
  let rim=NSBezierPath(roundedRect:outer.insetBy(dx:10,dy:10),xRadius:15,yRadius:15)
  glass(1,0.78).setStroke(); rim.lineWidth=4; rim.stroke()
  box(NSRect(x:85,y:139,width:108,height:746),glass(0.13),9)
  let hinge=NSBezierPath(roundedRect:NSRect(x:92,y:147,width:86,height:730),xRadius:6,yRadius:6)
  NSGradient(colors:[glass(0.12),glass(0.31),glass(0.16),glass(0.42)])!.draw(in:hinge,angle:0)
  for x in stride(from:100,through:170,by:10) { box(NSRect(x:x,y:157,width:2,height:710),glass(1,0.12),1) }
  let art=NSRect(x:207,y:151,width:713,height:722)
  box(art.insetBy(dx:-5,dy:-5),glass(0.27),5)
  NSGradient(starting:glass(0.73),ending:glass(0.92))!.draw(in:NSBezierPath(roundedRect:art,xRadius:3,yRadius:3),angle:90)
  picture(art,radius:3)
  NSGraphicsContext.saveGraphicsState(); NSBezierPath(roundedRect:art,xRadius:3,yRadius:3).addClip()
  let shine=NSBezierPath(); shine.move(to:NSPoint(x:art.minX,y:art.maxY)); shine.line(to:NSPoint(x:art.maxX,y:art.maxY)); shine.line(to:NSPoint(x:art.maxX,y:art.minY+380)); shine.line(to:NSPoint(x:art.minX,y:art.minY+90)); shine.close()
  NSGradient(starting:glass(1,0.02),ending:glass(1,0.17))!.draw(in:shine,angle:90)
  NSGraphicsContext.restoreGraphicsState()
  // Clear retaining tabs, hinge pins and double highlights model the acrylic lid.
  for y in [168,816] {
   let tab=NSBezierPath(roundedRect:NSRect(x:180,y:y,width:28,height:42),xRadius:5,yRadius:5)
   NSGradient(starting:glass(0.39,0.8),ending:glass(0.95,0.85))!.draw(in:tab,angle:0)
  }
  box(NSRect(x:212,y:889,width:697,height:4),glass(1,0.78),2)
  box(NSRect(x:212,y:132,width:697,height:3),glass(1,0.62),1)
  box(NSRect(x:936,y:164,width:4,height:694),glass(1,0.65),2)
  box(NSRect(x:927,y:166,width:2,height:690),glass(0.21,0.40),1)
  box(NSRect(x:930,y:454,width:12,height:92),glass(0.38,0.55),5)
 case "Box", "Slip Cover":
  let r = NSRect(x:205,y:60,width:614,height:904)
  box(r,.darkGray,22)
  picture(NSRect(x:r.minX+50,y:r.minY+28,width:r.width-72,height:r.height-56),radius:5)
  box(NSRect(x:r.minX+10,y:r.minY+20,width:22,height:r.height-40),.gray,4)
  if style == "Box" { let p=NSBezierPath(); p.move(to:NSPoint(x:r.maxX,y:r.minY)); p.line(to:NSPoint(x:r.maxX+65,y:r.minY+55)); p.line(to:NSPoint(x:r.maxX+65,y:r.maxY-40)); p.line(to:NSPoint(x:r.maxX,y:r.maxY)); p.close(); NSColor.gray.setFill(); p.fill() }
  if style == "Slip Cover" { box(NSRect(x:r.minX,y:r.minY,width:r.width,height:85),.brown,4) }
 default: picture(NSRect(x:0,y:0,width:1024,height:1024))
 }
 if !s.text.isEmpty {
  if style == "VCard" {
   let text=NSAttributedString(string:s.text,attributes:[.font:NSFont.systemFont(ofSize:min(96,max(18,s.textSize*0.45)),weight:.semibold),.foregroundColor:mediaColor(0.14,0.21,0.25)])
   text.draw(in:NSRect(x:480,y:563,width:394,height:119))
  } else {
   let attrs:[NSAttributedString.Key:Any] = [.font:NSFont.systemFont(ofSize:s.textSize,weight:.bold),.foregroundColor:NSColor.white,.strokeColor:NSColor.black,.strokeWidth: -3]
   let text=NSAttributedString(string:s.text,attributes:attrs);let size=text.size();text.draw(at:NSPoint(x:(1024-size.width)/2,y:130))
  }
 }

 NSGraphicsContext.restoreGraphicsState()
 let result=NSImage(size:NSSize(width:1024,height:1024)); result.addRepresentation(bitmap); return result
}

func png(_ image:NSImage, size:Int=1024, jpeg:Bool=false, alpha:Bool=true) throws -> Data {
 guard let rep=NSBitmapImageRep(bitmapDataPlanes:nil,pixelsWide:size,pixelsHigh:size,bitsPerSample:8,samplesPerPixel:4,hasAlpha:true,isPlanar:false,colorSpaceName:.deviceRGB,bytesPerRow:0,bitsPerPixel:0) else { throw CocoaError(.fileWriteUnknown) }
 NSGraphicsContext.saveGraphicsState(); NSGraphicsContext.current=NSGraphicsContext(bitmapImageRep:rep); NSGraphicsContext.current?.imageInterpolation = .high
 if jpeg || !alpha { NSColor.white.setFill(); NSRect(x:0,y:0,width:size,height:size).fill() }
 image.draw(in:NSRect(x:0,y:0,width:size,height:size)); NSGraphicsContext.restoreGraphicsState()
 if !alpha {
  guard let cg=rep.cgImage, let ctx=CGContext(data:nil,width:size,height:size,bitsPerComponent:8,bytesPerRow:size*4,space:CGColorSpaceCreateDeviceRGB(),bitmapInfo:CGImageAlphaInfo.noneSkipLast.rawValue) else { throw CocoaError(.fileWriteUnknown) }
  ctx.setFillColor(NSColor.white.cgColor); ctx.fill(CGRect(x:0,y:0,width:size,height:size)); ctx.draw(cg,in:CGRect(x:0,y:0,width:size,height:size))
  guard let output=ctx.makeImage(),let data=NSBitmapImageRep(cgImage:output).representation(using:.png,properties:[:]) else { throw CocoaError(.fileWriteUnknown) }; return data
 }
 guard let data=rep.representation(using:jpeg ? .jpeg : .png,properties:[.compressionFactor:0.95]) else { throw CocoaError(.fileWriteUnknown) }; return data
}
func ico(_ image:NSImage) throws -> Data {
 let sizes=[16,32,48,128,256]; let images=try sizes.map { try png(image,size:$0) }; var data=Data()
 func u16(_ n:Int) { var v=UInt16(n).littleEndian; withUnsafeBytes(of:&v) { data.append(contentsOf:$0) } }
 func u32(_ n:Int) { var v=UInt32(n).littleEndian; withUnsafeBytes(of:&v) { data.append(contentsOf:$0) } }
 u16(0); u16(1); u16(sizes.count); var offset=6+16*sizes.count
 for (i,n) in sizes.enumerated() { data.append(contentsOf:[UInt8(n == 256 ? 0 : n),UInt8(n == 256 ? 0 : n),0,0]); u16(1); u16(32); u32(images[i].count); u32(offset); offset += images[i].count }
 for image in images { data.append(image) }; return data
}
func icns(_ image:NSImage) throws -> Data {
 var payload=Data()
 func big(_ n:Int)->Data { var v=UInt32(n).bigEndian; return withUnsafeBytes(of:&v) { Data($0) } }
 for (type,size) in [("icp4",16),("icp5",32),("icp6",64),("ic07",128),("ic08",256),("ic09",512),("ic10",1024),("ic11",32),("ic12",64),("ic13",256),("ic14",512)] {
  let data=try png(image,size:size); payload.append(type.data(using:.ascii)!); payload.append(big(data.count+8)); payload.append(data)
 }
 var result=Data("icns".utf8); result.append(big(payload.count+8)); result.append(payload); return result
}
func exportImage(_ image:NSImage, format:String, to base:URL) throws -> URL {
 let fm=FileManager.default
 if format == "ICNS" { let url=base.appendingPathExtension("icns"); try icns(image).write(to:url); return url }
 if format == "PNG" || format == "JPG" || format == "ICO" { let url=base.appendingPathExtension(format.lowercased()); try (format == "ICO" ? ico(image) : png(image,jpeg:format == "JPG")).write(to:url); return url }
 if format == "Folder" { try fm.createDirectory(at:base,withIntermediateDirectories:true); guard NSWorkspace.shared.setIcon(image,forFile:base.path,options:[]) else { throw CocoaError(.fileWriteUnknown) }; return base }
 let folder=base.appendingPathExtension(format == "ICNS" || format == "Iconset" ? "iconset" : format == "iOS" ? "appiconset" : format.lowercased())
 try fm.createDirectory(at:folder,withIntermediateDirectories:true)
 if format == "ICNS" || format == "Iconset" {
  for n in [16,32,128,256,512] { try png(image,size:n).write(to:folder.appendingPathComponent("icon_\(n)x\(n).png")); try png(image,size:n*2).write(to:folder.appendingPathComponent("icon_\(n)x\(n)@2x.png")) }

 } else if format == "iOS" {
  var entries=[[String:String]]()
  var exportSettings=Settings(); exportSettings.transparent=false
  let opaque=render(image,style:"Original",settings:exportSettings)
  let specs:[(String,[Double],[Int])] = [("iphone",[20,29,40,60],[2,3]),("ipad",[20,29,40,76],[1,2])]
  for (idiom,sizes,scales) in specs { for n in sizes { for scale in scales {
   let filename="\(idiom)-\(n)-\(scale)x.png"
   try png(opaque,size:Int(n*Double(scale)),alpha:false).write(to:folder.appendingPathComponent(filename))
   entries.append(["idiom":idiom,"size":"\(n)x\(n)","scale":"\(scale)x","filename":filename])
  } } }
  for (idiom,n,scale) in [("ipad",83.5,2),("ios-marketing",1024.0,1)] {
   let filename="\(idiom)-\(n)-\(scale)x.png"; try png(opaque,size:Int(n*Double(scale)),alpha:false).write(to:folder.appendingPathComponent(filename)); entries.append(["idiom":idiom,"size":"\(n)x\(n)","scale":"\(scale)x","filename":filename])
  }
  let json:[String:Any] = ["images":entries,"info":["version":1,"author":"Create Icons"]]; try JSONSerialization.data(withJSONObject:json,options:.prettyPrinted).write(to:folder.appendingPathComponent("Contents.json"))
 } else if format == "Android" {
  for (name,n) in [("mdpi",48),("hdpi",72),("xhdpi",96),("xxhdpi",144),("xxxhdpi",192)] { let d=folder.appendingPathComponent("mipmap-"+name); try fm.createDirectory(at:d,withIntermediateDirectories:true); try png(image,size:n).write(to:d.appendingPathComponent("ic_launcher.png")) }; try png(image,size:512).write(to:folder.appendingPathComponent("play-store.png"))
 } else {
  try ico(image).write(to:folder.appendingPathComponent("favicon.ico")); for n in [16,32,48,180,192,512] { try png(image,size:n).write(to:folder.appendingPathComponent("icon-\(n).png")) }
  try "{\"name\":\"Create Icons\",\"icons\":[{\"src\":\"icon-192.png\",\"sizes\":\"192x192\",\"type\":\"image/png\"},{\"src\":\"icon-512.png\",\"sizes\":\"512x512\",\"type\":\"image/png\"}]}".write(to:folder.appendingPathComponent("site.webmanifest"),atomically:true,encoding:.utf8)
 }
 return folder
}

@MainActor final class Model:ObservableObject {
 @Published var image:NSImage?
 @Published var originals:[(URL,NSImage)] = []
 @Published var style="macOS App"
 @Published var settings=Settings()
 @Published var format="ICNS"
 @Published var name="Create Icon"
 @Published var status=""
 @Published var busy=false
 @Published var all=false
 @Published var batch=false
 @Published var target=false
 @Published var language=UserDefaults.standard.string(forKey:"language") ?? "fr" { didSet { UserDefaults.standard.set(language,forKey:"language") } }
 @Published var lastURL:URL?
 private let previewBundle:Bundle
 private var startupThumbnails:[String:NSImage] = [:]
 private lazy var exampleImage:NSImage = {
  if let url=previewBundle.url(forResource:"AppIcon",withExtension:"icns"),let image=NSImage(contentsOf:url) { return image }
  return NSImage(contentsOfFile:"/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/GenericApplicationIcon.icns") ?? NSImage(size:NSSize(width:1024,height:1024))
 }()
 init(previewBundle:Bundle = .main) { self.previewBundle=previewBundle }
 func thumbnail(for style:String)->NSImage {
  if let source=image { return render(source,style:style,settings:settings) }
  if let cached=startupThumbnails[style] { return cached }
  let thumbnail:NSImage
  if let url=previewBundle.url(forResource:style,withExtension:"png",subdirectory:"StylePreviews"),let bundled=NSImage(contentsOf:url) {
   thumbnail=bundled
  } else {
   thumbnail=render(exampleImage,style:style,settings:Settings())
  }
  startupThumbnails[style]=thumbnail
  return thumbnail
 }
 func t(_ key:String)->String { translations[language]?[key] ?? extraTranslations[language]?[key] ?? english[key] ?? key }
 func label(_ style:String)->String { (language == "fr" ? frenchStyles : localizedStyles[language] ?? styles)[styles.firstIndex(of:style) ?? 0] }
 var preview:NSImage? { image.map { render($0,style:style,settings:settings) } }
 var displayPreview:NSImage { render(image ?? exampleImage,style:style,settings:settings) }
 func load(_ urls:[URL]) { let valid=urls.compactMap { url -> (URL,NSImage)? in let image=NSImage(contentsOf:url) ?? NSWorkspace.shared.icon(forFile:url.path); guard image.size.width>0,image.size.height>0 else { return nil }; return (url,image) }; guard let first=valid.first else { status="⚠️ "+t("empty"); return }; originals=valid; image=first.1; name=first.0.deletingPathExtension().lastPathComponent; settings=Settings(); status="\(valid.count) image(s)" }
 func choose() { let p=NSOpenPanel(); p.allowedContentTypes=[.image,.pdf]; p.allowsMultipleSelection=true; if p.runModal() == .OK { load(p.urls) } }
 func drop(_ providers:[NSItemProvider])->Bool {
  let urls=providers.filter { $0.hasItemConformingToTypeIdentifier(UTType.fileURL.identifier) }
  if !urls.isEmpty { let group=DispatchGroup(); let lock=NSLock(); var result=[URL]()
   for p in urls { group.enter(); p.loadItem(forTypeIdentifier:UTType.fileURL.identifier,options:nil) { data,_ in defer { group.leave() }; let url=(data as? URL) ?? (data as? Data).flatMap { URL(dataRepresentation:$0,relativeTo:nil) }; if let url=url { lock.lock(); result.append(url); lock.unlock() } } }
   group.notify(queue:.main) {
    let folders=result.filter { (try? $0.resourceValues(forKeys:[.isDirectoryKey]).isDirectory) == true }
    if self.image != nil && folders.count == result.count, let icon=self.preview { let ok=folders.allSatisfy { NSWorkspace.shared.setIcon(icon,forFile:$0.path,options:[]) }; self.status=ok ? "✓" : "⚠️" } else { self.load(result) }
   }; return true
  }
  if let p=providers.first(where:{$0.canLoadObject(ofClass:NSImage.self)}) { _=p.loadObject(ofClass:NSImage.self) { object,_ in if let image=object as? NSImage { DispatchQueue.main.async { self.image=image; self.originals=[]; self.name="Create Icon" } } }; return true }; return false
 }
 func reset() { settings=Settings(); if let first=originals.first { image=first.1 } }
 func removeBackground() {
  guard let source=image, let cg=source.cgImage(forProposedRect:nil,context:nil,hints:nil) else { return }
  busy=true; status=t("remove")+"…"
  DispatchQueue.global(qos:.userInitiated).async {
   do { let request=VNGenerateForegroundInstanceMaskRequest(); let handler=VNImageRequestHandler(cgImage:cg); try handler.perform([request]); guard let observation=request.results?.first,!observation.allInstances.isEmpty else { throw NSError(domain:"No foreground detected",code:1) }; let buffer=try observation.generateMaskedImage(ofInstances:observation.allInstances,from:handler,croppedToInstancesExtent:false); let ci=CIImage(cvPixelBuffer:buffer); guard let cg=CIContext().createCGImage(ci,from:ci.extent) else { throw CocoaError(.coderInvalidValue) }; DispatchQueue.main.async { self.image=NSImage(cgImage:cg,size:source.size); self.busy=false; self.status="✓" } }
   catch { DispatchQueue.main.async { self.busy=false; self.status=error.localizedDescription } }
  }
 }
 func export(to directory:URL?=nil) {
  guard let image=image else { return }; busy=true
  do {
   let desktop=directory ?? FileManager.default.urls(for:.desktopDirectory,in:.userDomainMask)[0]
   let cleaned=name.components(separatedBy:CharacterSet(charactersIn:"/:\\\n")).joined(separator:"-"); let safe=cleaned.isEmpty ? "Create Icon" : cleaned
   let root=desktop.appendingPathComponent(safe+" - "+UUID().uuidString.prefix(6)); let multi=all || batch
   if multi { try FileManager.default.createDirectory(at:root,withIntermediateDirectories:true) }
   let inputs=batch && !originals.isEmpty ? originals.map { ($0.0.deletingPathExtension().lastPathComponent,$0.1) } : [(safe,image)]
   var last:URL?
   for (index,input) in inputs.enumerated() { for style in (all ? styles : [self.style]) { let base=multi ? root.appendingPathComponent("\(index+1)-\(input.0.replacingOccurrences(of:"/",with:"-"))-\(style)") : root; last=try exportImage(render(input.1,style:style,settings:settings),format:format,to:base) } }
   lastURL=multi ? root : last; status="✓ "+t("exported")
  } catch { status="⚠️ "+error.localizedDescription }; busy=false
 }
 func apply(restore:Bool=false) { guard restore || preview != nil else { return }; let p=NSOpenPanel(); p.canChooseDirectories=true; p.canChooseFiles=true; p.allowsMultipleSelection=true; if p.runModal() == .OK { let icon=restore ? nil : preview; let ok=p.urls.allSatisfy { NSWorkspace.shared.setIcon(icon,forFile:$0.path,options:[]) }; status=ok ? "✓" : "⚠️" } }
}

struct ContentView:View {
 @StateObject var m=Model()
 var body:some View {
  HStack(spacing:0) {
   VStack(alignment:.leading,spacing:12) {
    Text("Create Icons").font(.title2.bold()).padding(.top,10)
    Text(m.t("styles")).font(.subheadline).foregroundStyle(.secondary)
    ScrollView { LazyVGrid(columns:[GridItem(.flexible()),GridItem(.flexible())],spacing:8) {
     ForEach(styles,id:\.self) { style in
      Button { m.style=style } label: { VStack(spacing:4) {
       Image(nsImage:m.thumbnail(for:style)).resizable().interpolation(.high).scaledToFit().frame(height:65)
       Text(m.label(style)).font(.system(size:10,weight:.medium)).lineLimit(2).frame(height:26)
      }.frame(maxWidth:.infinity).padding(6).background(m.style == style ? Color.accentColor.opacity(0.25) : Color.primary.opacity(0.04),in:RoundedRectangle(cornerRadius:10)).overlay(RoundedRectangle(cornerRadius:10).stroke(m.style == style ? Color.accentColor : .clear,lineWidth:2)) }.buttonStyle(.plain)
     }
    } }
   }.padding(16).frame(width:246)
   Divider()
   VStack(spacing:16) {
    HStack { Button(action:m.choose) { Label(m.t("import"),systemImage:"photo.badge.plus") }; Spacer(); Picker(m.t("language"),selection:$m.language) { Text("Français").tag("fr"); Text("English").tag("en"); Text("Español").tag("es"); Text("Deutsch").tag("de"); Text("Italiano").tag("it") }.labelsHidden().frame(width:125) }
    Spacer(minLength:0)
    ZStack {
     Checkerboard().clipShape(RoundedRectangle(cornerRadius:24))
     VStack(spacing:8) {
      Image(nsImage:m.displayPreview).resizable().interpolation(.high).scaledToFit().padding(6).accessibilityLabel(m.label(m.style))
      if m.image == nil {
       Text(m.t("drop")).font(.subheadline).foregroundStyle(.secondary)
       Button(m.t("choose"),action:m.choose).padding(.bottom,6)
      }
     }.padding(18)

    }.frame(maxWidth:600,maxHeight:600).aspectRatio(1,contentMode:.fit).overlay(RoundedRectangle(cornerRadius:24).stroke(m.target ? Color.accentColor : Color.primary.opacity(0.12),lineWidth:m.target ? 3 : 1)).onDrop(of:[UTType.fileURL.identifier,UTType.image.identifier],isTargeted:$m.target,perform:m.drop)
    Text(m.label(m.style)).font(.headline)
    Spacer(minLength:0)
    HStack { if m.busy { ProgressView().controlSize(.small) }; Text(m.status).font(.caption).lineLimit(2); Spacer(); if let url=m.lastURL { Button { NSWorkspace.shared.activateFileViewerSelecting([url]) } label: { Image(systemName:"folder") }.help(m.t("reveal")) } }.frame(height:30)
   }.padding(24).frame(minWidth:360,maxWidth:.infinity)
   Divider()
   ScrollView {
    VStack(alignment:.leading,spacing:14) {
     Text(m.t("adjust")).font(.title3.bold())
     Picker("",selection:$m.settings.fill) { Text(m.t("fit")).tag(false); Text(m.t("fill")).tag(true) }.pickerStyle(.segmented)
     adjustment(m.t("zoom"),value:$m.settings.zoom,range:0.1...3)
     adjustment(m.t("rotation"),value:$m.settings.rotation,range: -180...180)
     adjustment(m.t("horizontal"),value:$m.settings.x,range: -1...1)
     adjustment(m.t("vertical"),value:$m.settings.y,range: -1...1)
     Toggle(m.t("mirror"),isOn:$m.settings.mirror)
     Toggle(m.t("transparent"),isOn:$m.settings.transparent)
     ColorPicker(m.t("background"),selection:Binding(get:{Color(nsColor:m.settings.background)},set:{m.settings.background=NSColor($0)}))
     TextField(m.t("text"),text:$m.settings.text).textFieldStyle(.roundedBorder)
     adjustment(m.t("size"),value:$m.settings.textSize,range:40...300)
     Button(m.t("remove"),action:m.removeBackground).disabled(m.image == nil || m.busy)
     Button(m.t("reset"),action:m.reset)
     Divider()
     TextField(m.t("name"),text:$m.name).textFieldStyle(.roundedBorder)
     Picker(m.t("format"),selection:$m.format) { ForEach(["ICNS","PNG","JPG","ICO","Folder","Iconset","iOS","Android","Favicon"],id:\.self) { Text($0).tag($0) } }
     Toggle(m.t("all"),isOn:$m.all)
     Toggle(m.t("batch"),isOn:$m.batch)
     Button(action:{m.export()}) { Label(m.t("export"),systemImage:"square.and.arrow.up").frame(maxWidth:.infinity) }.buttonStyle(.borderedProminent).controlSize(.large).disabled(m.image == nil || m.busy)
     Divider()
     Button(m.t("apply")) { m.apply() }.disabled(m.image == nil)
     Button(m.t("restore")) { m.apply(restore:true) }
    }.padding(20)
   }.frame(width:282)
  }.frame(minWidth:1040,minHeight:740).background(Color(nsColor:.windowBackgroundColor)).onPasteCommand(of:[.image,.fileURL]) { _=m.drop($0) }.onAppear { DispatchQueue.main.async { arrangeUpdateMenu() } }.onChange(of:m.language) { _, _ in DispatchQueue.main.async { arrangeUpdateMenu() } }
 }
 func adjustment(_ label:String,value:Binding<Double>,range:ClosedRange<Double>)->some View { VStack(alignment:.leading,spacing:2) { Text(label).font(.caption).foregroundStyle(.secondary); Slider(value:value,in:range) } }

}
struct Checkerboard:View { var body:some View { Canvas { ctx,size in let cell:CGFloat=16; for x in stride(from:CGFloat(0),to:size.width,by:cell) { for y in stride(from:CGFloat(0),to:size.height,by:cell) { ctx.fill(Path(CGRect(x:x,y:y,width:cell,height:cell)),with:.color(Int(x/cell+y/cell)%2 == 0 ? Color.gray.opacity(0.12) : Color.gray.opacity(0.22))) } } } } }

@MainActor func arrangeUpdateMenu() {
 guard let bar=NSApplication.shared.mainMenu else { return }
 let standardHelp=NSApplication.shared.helpMenu
 let helpNames:Set<String> = ["Help","Aide","Hilfe","Ayuda","Aiuto"]
 for item in bar.items where (standardHelp != nil && item.submenu === standardHelp) || helpNames.contains(item.title) { bar.removeItem(item) }
 NSApplication.shared.helpMenu=nil
 let updateNames:Set<String> = ["Vérifier les mises à jour","Check for Updates","Buscar actualizaciones","Nach Updates suchen","Cerca aggiornamenti"]
 if let item=bar.items.first(where:{updateNames.contains($0.title)}),bar.items.last !== item { bar.removeItem(item);bar.addItem(item) }
}

struct UpdateMenu:Commands {
 @AppStorage("language") private var language="fr"
 private func text(_ key:String)->String {
  let words:[String:[String:String]] = [
   "fr":["menu":"Vérifier les mises à jour","check":"Vérifier maintenant…","version":"Version installée","title":"Mises à jour de Create Icons","pending":"La vérification en ligne n’est pas encore activée. Elle sera disponible dès la mise en place du service de mise à jour.","close":"Fermer"],
   "en":["menu":"Check for Updates","check":"Check now…","version":"Installed version","title":"Create Icons Updates","pending":"Online update checking is not enabled yet. It will become available when the update service is set up.","close":"Close"],
   "es":["menu":"Buscar actualizaciones","check":"Comprobar ahora…","version":"Versión instalada","title":"Actualizaciones de Create Icons","pending":"La búsqueda en línea aún no está activada. Estará disponible cuando se configure el servicio de actualizaciones.","close":"Cerrar"],
   "de":["menu":"Nach Updates suchen","check":"Jetzt prüfen…","version":"Installierte Version","title":"Create Icons Updates","pending":"Die Online-Prüfung ist noch nicht aktiviert. Sie wird verfügbar, sobald der Update-Dienst eingerichtet ist.","close":"Schließen"],
   "it":["menu":"Cerca aggiornamenti","check":"Controlla ora…","version":"Versione installata","title":"Aggiornamenti di Create Icons","pending":"La verifica online non è ancora attiva. Sarà disponibile quando verrà configurato il servizio di aggiornamento.","close":"Chiudi"]]
  return words[language]?[key] ?? words["en"]![key]!
 }
 private var version:String { Bundle.main.object(forInfoDictionaryKey:"CFBundleShortVersionString") as? String ?? "" }
 var body:some Commands {
  CommandGroup(replacing:.help) {}
  CommandMenu(text("menu")) {
   Button(text("check")) {
    let alert=NSAlert();alert.messageText=text("title");alert.informativeText=text("version")+" : "+version+"\n\n"+text("pending");alert.addButton(withTitle:text("close"));alert.runModal()
   }
   Divider()
   Text(text("version")+" : "+version)
  }
 }
}

@main struct CreateIconsApp:App {
 var body:some Scene { WindowGroup("Create Icons") { ContentView() }.windowStyle(.titleBar).defaultSize(width:1160,height:820).commands { CommandGroup(replacing:.newItem) {}; UpdateMenu() } }
}
