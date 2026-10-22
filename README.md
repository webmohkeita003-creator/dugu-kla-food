# DUGU KLA FOOD — VERSION COMPLÈTE

## Architecture
- Frontend : HTML / CSS / JavaScript
- Base : Supabase PostgreSQL
- Authentification : Supabase Auth
- Commandes : Supabase
- Administration : `admin.html`
- Client : `index.html`
- Compatible avec un téléphone Android pour le développement.

## Installation

### A. Supabase
1. Crée un projet Supabase.
2. Ouvre SQL Editor.
3. Colle `supabase-schema.sql`.
4. Exécute tout le script.
5. Dans Authentication > Users, crée le compte du gérant.
6. Dans Project Settings > API, récupère Project URL + anon public key.

### B. Connexion
Ouvre `config.js` et remplis :
- SUPABASE_URL
- SUPABASE_ANON_KEY
- WHATSAPP_NUMBER

Exemple du numéro WhatsApp :
`2237XXXXXXX`
avec indicatif pays, sans `+`, espaces ou tirets.

### C. Tester
- `index.html` = site client.
- `admin.html` = espace gérant.

Le gérant peut :
- consulter les commandes ;
- changer leur statut ;
- voir le chiffre d'affaires ;
- ajouter un plat ;
- modifier prix, description, photo et disponibilité ;
- supprimer un plat.

### D. Photos depuis téléphone
La version actuelle accepte une URL d'image dans le champ photo.
Étape suivante recommandée : ajouter Supabase Storage pour que le gérant sélectionne directement une photo dans la galerie Android.

### E. WhatsApp
Après une commande enregistrée, le client peut ouvrir WhatsApp pour prévenir le restaurant.
Le numéro est défini dans `config.js`.

### Sécurité
La clé `anon public` est destinée au frontend avec les politiques RLS.
Ne jamais publier `service_role`.

## Déploiement
Le frontend peut être publié avec GitHub Pages, Netlify ou Vercel.
