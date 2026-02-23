# Kno — Assistant GED Local

> **Votre IA privée. Vos documents. Votre serveur.**

[![License](https://img.shields.io/badge/License-Commercial-orange.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux-blue.svg)]()
[![Version](https://img.shields.io/badge/Version-1.0-green.svg)]()

---

## Qu'est-ce que Kno ?

**Kno** est un assistant intelligent de gestion documentaire (GED) qui tourne **entièrement sur votre machine**. Posez des questions en langage naturel sur vos documents PDF, Word, Excel, Markdown et texte — sans envoyer une seule donnée vers le cloud.

```
Vous : "Quelle est la clause de résiliation dans mon contrat avec Dupont SAS ?"
Kno  : "Selon l'article 12.3 du contrat (contrat_dupont_2024.pdf), la résiliation..."
```

---

## Pourquoi Kno ?

| Problème | Solution Kno |
|---|---|
| ChatGPT lit vos documents confidentiels | Tout reste sur votre serveur |
| Les solutions cloud coûtent cher par mois | Licence unique, pas d'abonnement |
| Les RAG open-source sont complexes à installer | Un seul `.exe`, zéro configuration |
| Données médicales, juridiques, RH sensibles | Conformité RGPD by design |

---

## Fonctionnalités

- **RAG local** — Retrieval-Augmented Generation sur vos propres documents
- **Interface web** — Accessible depuis n'importe quel navigateur sur le réseau local
- **Multi-format** — PDF, DOCX, TXT, MD, XLSX
- **Administration** — Interface admin complète : gestion des documents, modèles IA, sécurité
- **Modèles GGUF** — Compatible avec tous les modèles llama.cpp (Mistral, Phi, LLaMA, etc.)
- **Multi-utilisateurs** — Un seul serveur, plusieurs utilisateurs simultanés
- **Aucune dépendance cloud** — Fonctionne sans connexion internet après installation

---

## Captures d'écran

| Interface Chat | Administration | Gestion des documents |
|---|---|---|
| ![Chat](docs/screenshots/chat.png) | ![Admin](docs/screenshots/admin.png) | ![Documents](docs/screenshots/documents.png) |

---

## Installation rapide

### Prérequis
- Windows 10/11 64-bit (Linux en préparation)
- 8 Go RAM minimum (16 Go recommandé pour Mistral 7B)
- 6 Go d'espace disque (modèle inclus)

### En 3 étapes

**1. Télécharger** Kno depuis la page [Releases](https://github.com/kno-by-Fdevelopment-LTD/kno/releases)

**2. Placer votre modèle GGUF** dans le dossier `models/`
```
kno/
├── kno.exe
├── models/
│   └── Mistral-7B-Instruct-v0.3.Q4_K_M.gguf   ← ici
└── ...
```

**3. Lancer `kno.exe`** et ouvrir `http://localhost:8000`

L'interface admin est disponible sur `http://localhost:8000/admin` (mot de passe configurable dans `config.json`).

---

## Modèles recommandés

| Modèle | Taille | RAM requise | Qualité |
|---|---|---|---|
| [Mistral-7B-Instruct-v0.3.Q4_K_M](https://huggingface.co/bartowski/Mistral-7B-Instruct-v0.3-GGUF) | 4.4 Go | 8 Go | ⭐⭐⭐⭐⭐ Recommandé |
| [Phi-3-mini-4k-instruct.Q4_K_M](https://huggingface.co/microsoft/Phi-3-mini-4k-instruct-gguf) | 2.2 Go | 6 Go | ⭐⭐⭐⭐ Léger |
| [LLaMA-3.1-8B-Instruct.Q4_K_M](https://huggingface.co/bartowski/Meta-Llama-3.1-8B-Instruct-GGUF) | 4.9 Go | 10 Go | ⭐⭐⭐⭐⭐ Excellent |

---

## Tarifs

| Licence | Prix | Utilisateurs | Mises à jour |
|---|---|---|---|
| **Solo** | 39 € | 1 | 1 an inclus |
| **Étudiant** | 19 € | 1 | 1 an inclus |
| **Pro** | 99 € | Jusqu'à 5 | 1 an inclus |
| **Business** | 299 € | Illimité (1 site) | 1 an inclus |
| **Enterprise** | Sur devis | Multi-sites | Support dédié |

[→ Acheter une licence](https://fdevelopment.ltd/kno)

---

## Sécurité & Confidentialité

- **100% local** — Aucune télémétrie, aucun appel réseau externe
- **Authentification admin** — Interface d'administration protégée par mot de passe
- **Réseau local uniquement** — Accessible uniquement depuis votre LAN
- **RGPD compatible** — Aucune donnée ne quitte votre infrastructure
- **Idéal pour** : documents médicaux, juridiques, RH, financiers, R&D

---

## Architecture technique

```
kno.exe (PyInstaller)
├── FastAPI + Uvicorn          (serveur web)
├── LangChain + FAISS          (RAG pipeline)
├── llama-cpp-python           (inférence LLM locale)
├── fastembed / ONNX Runtime   (embeddings)
└── Interface web HTML/JS      (UI)
```

---

## Licence

Kno est un logiciel commercial propriétaire.  
© 2026 Fdevelopment LTD — Tous droits réservés.  
Voir [LICENSE](LICENSE) pour les conditions d'utilisation.

---

## Contact

- **Site** : [fdevelopment.ltd](https://fdevelopment.ltd)
- **Email** : contact@fdevelopment.ltd
- **GitHub** : [@kno-by-Fdevelopment-LTD](https://github.com/kno-by-Fdevelopment-LTD)
