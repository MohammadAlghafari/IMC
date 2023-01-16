import 'package:imc/TeamLeader/data/model/team_leader_question_model.dart';

class TeamLeaderQuestionRepository {
  ///A Posteriori -> Client Absent -> Meter Accessible (16 Q).
  static List<TeamLeaderQuestionModel> _list1 = [
    TeamLeaderQuestionModel(id: 1, questionAsked: "L'analyse de GRIP est-elle conforme (notation en phase avec la réalité) ?"),
    TeamLeaderQuestionModel(id: 2, questionAsked: "L'état general du tableau de comptage, a permis le remplacement du compteur ?"),
    TeamLeaderQuestionModel(id: 3, questionAsked: "Les caractéristiques du compteur posé sontelles conformes à la réalité constatée ?"),
    TeamLeaderQuestionModel(id: 4, questionAsked: "Lematricule compteur correspond il au nom du client associé ?"),
    TeamLeaderQuestionModel(id: 5, questionAsked: "Le matériel posé est il conforme et en bon etat ?"),
    TeamLeaderQuestionModel(id: 6, questionAsked: "Le compteur Linky est il bienn fixé et correctement orienté ?"),
    TeamLeaderQuestionModel(id: 7, questionAsked: "Le panneau de comptage est il conforme ?"),
    TeamLeaderQuestionModel(
      id: 8,
      questionAsked: "Les plastoscelles ont-ils correctement été posés / reposés sur les matériels appropiés ?",
    ),
    TeamLeaderQuestionModel(
      id: 9,
      questionAsked:
      "Le tehnicien s'est il assuré que le client n'avait pas d'asservissement ou dans le cas contraire, à til repris correctement l'installation ?",
    ),
    TeamLeaderQuestionModel(id: 10, questionAsked: "Le technicien a-t-il réalisé l'intervention sans dégradation ?"),
    TeamLeaderQuestionModel(id: 11, questionAsked: "Le technicien a-t-il laissé sur le lieu d'intervention des déchets liés à sa prestation ?"),
    TeamLeaderQuestionModel(id: 12, questionAsked: 'Aucun matériel provenant du remplacement du compteur n"a été laiss sur place ?'),
    TeamLeaderQuestionModel(id: 13, questionAsked: "La valeur de réglage du disjoncteur est elle correcte ?"),
    TeamLeaderQuestionModel(id: 14, questionAsked: "Les caractéristiques du dsjoncteur en place sontelles cohérentes ?"),
    TeamLeaderQuestionModel(id: 15, questionAsked: "Contrôler la cohérence des protections (réglage disj+fusible CCPI) ?"),
    TeamLeaderQuestionModel(id: 16, questionAsked: "La qualité du serrrage et le raccordement des câbles sont tils conformes ?"),
  ];

  ///A Posteriori -> Client Absent -> Meter Not Accessible (13 Q).
  static List<TeamLeaderQuestionModel> _list2 = [
    TeamLeaderQuestionModel(id: 1, questionAsked: "L'analyse de GRIP est-elle conforme (notation en phase avec la réalité)"),
    TeamLeaderQuestionModel(id: 2, questionAsked: "L'état général du tableau de comptage, a permis le remplacement du compteur"),
    TeamLeaderQuestionModel(id: 3, questionAsked: "Les caractéristiques du compteur posé sont-rllrs conformes à la réalité constatée ?"),
    TeamLeaderQuestionModel(id: 4, questionAsked: "Le matricule compteur correspont-il au nom du client associé ?"),
    TeamLeaderQuestionModel(id: 5, questionAsked: "Le matériel posé est-il comforme et en bon état ?"),
    TeamLeaderQuestionModel(id: 6, questionAsked: "Le compteur Linky est-il bien fixé et correctement orienté ?"),
    TeamLeaderQuestionModel(id: 7, questionAsked: "Le panneau de comptage est-il conforme ?"),
    TeamLeaderQuestionModel(id: 8, questionAsked: "Les plastoscellés ont-ils correctement été posés / reposés sur les matériels appropriés ?"),
    TeamLeaderQuestionModel(
      id: 9,
      questionAsked:
      "Le technicien s'est-il assuré que le client n'avait pas d'assservissement ou, dans le cas contraire, a-t-il repris correctement l'installation ?",
    ),
    TeamLeaderQuestionModel(id: 10, questionAsked: "Le technicien a-t-il réalisé l'intervention sans dégradation ?"),
    TeamLeaderQuestionModel(id: 11, questionAsked: "Le technicien a-t-il laissé sur le lieu d'intervention des déchets liés à sa prestation ?"),
    TeamLeaderQuestionModel(id: 12, questionAsked: "Aucun matériel provenant du remplacement du compteur n'a été laissé sur place ?"),
    TeamLeaderQuestionModel(id: 13, questionAsked: "La qualité du serrage et le raccordement des câbles sont-ils conformes ?"),
  ];

  ///A Posteriori -> Client Present -> Meter Accessible (20 Q).
  static List<TeamLeaderQuestionModel> _list3 = [
    TeamLeaderQuestionModel(id: 1, questionAsked: "L'analyse de GRIP est-elle conforme (notation en phase avec la réalité)"),
    TeamLeaderQuestionModel(id: 2, questionAsked: "L'état general du tableau de comptage, a permis le remplacement du compteur ?"),
    TeamLeaderQuestionModel(id: 3, questionAsked: "Les caractéristiques du compteur posé sont-rllrs conformes à la réalité constatée ?"),
    TeamLeaderQuestionModel(id: 4, questionAsked: "Le matricule compteur correspont-il au nom du client associé ?"),
    TeamLeaderQuestionModel(id: 5, questionAsked: "Le matériel posé est il conforme et en bon etat ?"),
    TeamLeaderQuestionModel(id: 6, questionAsked: "Le compteur Linky est il bienn fixé et correctement orienté ?"),
    TeamLeaderQuestionModel(id: 7, questionAsked: "Le panneau de comptage est il conforme ?"),
    TeamLeaderQuestionModel(id: 8, questionAsked: "Les plastoscellés ont-ils correctement été posés / reposés sur les matériels appropriés ?"),
    TeamLeaderQuestionModel(
      id: 9,
      questionAsked:
      "Le technicien s'est-il assuré que le client n'avait pas d'assservissement ou, dans le cas contraire, a-t-il repris correctement l'installation ?",
    ),
    TeamLeaderQuestionModel(id: 10, questionAsked: "Le technicien a-t-il réalisé l'intervention sans dégradation ?"),
    TeamLeaderQuestionModel(id: 11, questionAsked: "Le technicien a-t-il laissé sur le lieu d'intervention des déchets liés à sa prestation ?"),
    TeamLeaderQuestionModel(id: 12, questionAsked: 'Aucun matériel provenant du remplacement du compteur n"a été laiss sur place ?'),
    TeamLeaderQuestionModel(id: 13, questionAsked: "La valeur de réglage du disjoncteur est elle correcte ?"),
    TeamLeaderQuestionModel(id: 14, questionAsked: "Les caractéristiques du dsjoncteur en place sontelles cohérentes ?"),
    TeamLeaderQuestionModel(
      id: 15,
      questionAsked:
      "Le technicien a-t-il demandé au client de couper ses appareils éléctriques sensibles et l'autorisation de procéder à la coupure avant de mettre l'installation hors tension ?",
    ),
    TeamLeaderQuestionModel(id: 16, questionAsked: "Le technicien a-t-il informé le client de la remise sous tension ?"),
    TeamLeaderQuestionModel(id: 17, questionAsked: "Le technicien a-t-il remis et commenté l'enveloppe Linky ?"),
    TeamLeaderQuestionModel(id: 18, questionAsked: "Le technicien a-t-il correctement expliqué le fonctionnement du compteur Linky au client ? "),
    TeamLeaderQuestionModel(id: 19, questionAsked: "Contrôler la cohérence des protections (réglage disj+fusible CCPI)"),
    TeamLeaderQuestionModel(id: 20, questionAsked: "La qualité du serrage et le raccordement des câbles sont-ils conformes ?"),
  ];

  ///A Posteriori -> Client Present -> Meter Not Accessible (17 Q).
  static List<TeamLeaderQuestionModel> _list4 = [
    TeamLeaderQuestionModel(id: 1, questionAsked: "L'état général du tableau de comptage, a permis le remplacement du compteur"),
    TeamLeaderQuestionModel(id: 2, questionAsked: "Les caractéristiques du compteur posé sontelles conformes à la réalité constatée ?"),
    TeamLeaderQuestionModel(id: 3, questionAsked: "Le matricule compteur correspont-il au nom du client associé ?"),
    TeamLeaderQuestionModel(id: 4, questionAsked: "Le matériel posé est-il comforme et en bon état ?"),
    TeamLeaderQuestionModel(id: 5, questionAsked: "Le compteur Linky est il bienn fixé et correctement orienté ?"),
    TeamLeaderQuestionModel(id: 6, questionAsked: "Le panneau de comptage est-il conforme ?"),
    TeamLeaderQuestionModel(
      id: 7,
      questionAsked: "Les plastoscellés ont-ils correctement été posés / reposés sur les matériels appropriés ?",
    ),
    TeamLeaderQuestionModel(
      id: 8,
      questionAsked:
      "Le technicien s'est-il assuré que le client n'avait pas d'assservissement ou, dans le cas contraire, a-t-il repris correctement l'installation ?",
    ),
    TeamLeaderQuestionModel(id: 9, questionAsked: "Le technicien a-t-il réalisé l'intervention sans dégradation ?"),
    TeamLeaderQuestionModel(id: 10, questionAsked: "Le technicien a-t-il laissé sur le lieu d'intervention des déchets liés à sa prestation ?"),
    TeamLeaderQuestionModel(id: 11, questionAsked: 'Aucun matériel provenant du remplacement du compteur n"a été laiss sur place ?'),
    TeamLeaderQuestionModel(id: 12, questionAsked: "La valeur de réglage du disjoncteur est elle correcte ?"),
    TeamLeaderQuestionModel(
      id: 13,
      questionAsked:
      "Le technicien a-t-il demandé au client de couper ses appareils éléctriques sensibles et l'autorisation de procéder à la coupure avant de mettre l'installation hors tension ?",
    ),
    TeamLeaderQuestionModel(id: 14, questionAsked: "Le technicien a-t-il informé le client de la remise sous tension ?"),
    TeamLeaderQuestionModel(id: 15, questionAsked: "Le technicien a-t-il remis et commenté l'enveloppe Linky ?"),
    TeamLeaderQuestionModel(id: 16, questionAsked: "Le technicien a-t-il correctement expliqué le fonctionnement du compteur Linky au client ?"),
    TeamLeaderQuestionModel(id: 17, questionAsked: "La qualité du serrage et le raccordement des câbles sont-ils conformes ?"),
  ];

  ///Simultanee -> Client Absent -> Meter Accessible (45 Q).
  static List<TeamLeaderQuestionModel> _list5 = [
    TeamLeaderQuestionModel(
        id: 1,
        questionAsked:
        "Le véhicule ou engin (PEMP) du technicien et son stationnement respectent t-ils les règles de sécurités ? L'emplacement du véhiculepermet-il de limiter le risque plain-pied pour le technicien ? Le balisage/signalisation du chantier est-il présent et en bon état ?"),
    TeamLeaderQuestionModel(id: 2, questionAsked: "Les éléments visuels sont-ils présents et visibles (Badge et Stickers) ?"),
    TeamLeaderQuestionModel(
      id: 3,
      questionAsked:
      "Le technicien dispose-t-il des habilitations nécessaires ( vérifier les domaines), de son totre de qualification, ainsi que des ITST et des IPS en vigueurs localement ? En cas d'utilisation d'une PEMP (Plates-formes Elévatrices Mobiles de Personnes): Le technicien est-il en possession de son CACES ou de son autorisation de conduite (AC) ?",
    ),
    TeamLeaderQuestionModel(
        id: 4, questionAsked: "Le technicien respecte-t-il les gestes barrières et les préconisations pour lutter contre la pandémie du COVID-19 ?"),
    TeamLeaderQuestionModel(
        id: 5,
        questionAsked:
        "Avant de vérifier la présence du client, le technicien a-t-il préparé le type de matériel adéquat pour réaliser son intervention ?"),
    TeamLeaderQuestionModel(
        id: 6, questionAsked: "Le technicien a-t-il vérifié la préssence / absence du client avant de commencer son intervention ?"),
    TeamLeaderQuestionModel(
        id: 7,
        questionAsked:
        "Avant toute opération de travail (électrique, déplacements, manutention, relation client), le technicien réalise t-il un TOP complet ?"),
    TeamLeaderQuestionModel(id: 8, questionAsked: "L'analyse de GRIP est elle conforme (notation en phase avec la réalité) ?"),
    TeamLeaderQuestionModel(
        id: 9,
        questionAsked: "Le technicien s'assure t-il de la véracité des informations concernant le compteur en place (situation et accessibilité) ?"),
    TeamLeaderQuestionModel(
        id: 10, questionAsked: "Avant d'intervenir le technicien s'assure t'il que le matricule comteur correspond-il au nom du client associé ?"),
    TeamLeaderQuestionModel(
        id: 11,
        questionAsked:
        "L'acheminement des compteurs et des matériels annexes est-il réalisé de sorte à assurer leur non dégradation et limiter le risque de manutention manuelle ?"),
    TeamLeaderQuestionModel(
        id: 12,
        questionAsked:
        "Le technicien optimise-t-il ses déplacements en alliant et en quittant le lieu de l'intervention pour éviter les risques d'accident de plain-pied ? Le poseur organise t-il son lieu d'intervention de manière à limiter le risque plain-pied ?"),
    TeamLeaderQuestionModel(
        id: 13,
        questionAsked:
        "Le technicien porte-t-il ses équipements de protection individuelle (EPI) adaptés à la situation de travail ou de manœuvre ? Celui-ci vérifie t-il l'état de ses EPI avant l'utilisation ?"),
    TeamLeaderQuestionModel(
        id: 14,
        questionAsked:
        "La reléve des index et la déconnexion des fils BTR pour un CBE (pose de ScotchLock) ont-ils été réalisés en cohérence avec le MODOP ?"),
    TeamLeaderQuestionModel(id: 15, questionAsked: "Les gants TST du poseurs sont-ils conformes et en bon état ?"),
    TeamLeaderQuestionModel(id: 16, questionAsked: "Le technicien réalise-t-il le test du disjoncteur dans le respect du mode opératoire ?"),
    TeamLeaderQuestionModel(id: 17, questionAsked: "Le technicien a-t-il collecté les caractéristiques du disjoncteur ?"),
    TeamLeaderQuestionModel(
        id: 18,
        questionAsked:
        "Le technicien a-t-il vérifié que le disjoncteur était fonctionnel et, si celui-ci est défectueux, a-t-il procédé à son remplacement ?"),
    TeamLeaderQuestionModel(
        id: 19, questionAsked: "Le technicien a-t-il vérifié la position de la phase avant la pose du Linky (dans le respect du mode opératoire)?"),
    TeamLeaderQuestionModel(id: 20, questionAsked: "Le technicien réalise-t-il son intervention avec un outillage adapté et en bon état apparent ?"),
    TeamLeaderQuestionModel(id: 21, questionAsked: "Le détecteur d'absence de tension a-t-il été vérifié ?"),
    TeamLeaderQuestionModel(
        id: 22,
        questionAsked:
        "Le technicien a-t-il réalisé ou fait réaliser la consignation en amont du compteur dans le respect du mode opératoire et le cas échéant des IPS/ITST adéquates ?"),
    TeamLeaderQuestionModel(
        id: 23,
        questionAsked:
        "Le technicien a-t-il réalisé la consignation de l'installation côté disjoncteur, dans le respect du mode opératoire et le cas échéant des IPS/ITST adéquates ?"),
    TeamLeaderQuestionModel(id: 24, questionAsked: "Le technicien a-t-il posé autant de macaron C11 que nécessaire ?"),
    TeamLeaderQuestionModel(id: 25, questionAsked: "Le technicien a-t-il respecté la procédure en cas de neutre non déconnectable ?"),
    TeamLeaderQuestionModel(
        id: 26,
        questionAsked:
        "Le technicien a-t-il vérifié que le disjoncteur était accessible pour enlever la charge côté client ou, dans le cas contraire, a-t-il mis en place l'accessoire de consignation spécifique ?"),
    TeamLeaderQuestionModel(id: 27, questionAsked: "bis. Le technicien respecte t-il les consignes concernant la pose du kit H/B ?"),
    TeamLeaderQuestionModel(
        id: 28, questionAsked: "Si les fils de puissance sont souples (multibrins) et non sertis, des embouts ont-ils été posés ?"),
    TeamLeaderQuestionModel(id: 29, questionAsked: "Le matériel posé est-il conforme et en bon état ?"),
    TeamLeaderQuestionModel(id: 30, questionAsked: "Le technicien s'est-il assuré du bon serrage des fils du compteur ?"),
    TeamLeaderQuestionModel(
        id: 31,
        questionAsked:
        "Le compteur Linky est-il bien fixé, correctement orienté et ne gênant pas la fermeture de la porte (coffret ou gaine) le cas échéant ?"),
    TeamLeaderQuestionModel(
        id: 32,
        questionAsked: "Avant remise sous tension, le technicien réalise-t-il une vérification d'absence de court circuit entre phase et neutre ?"),
    TeamLeaderQuestionModel(id: 33, questionAsked: "Les fils d'asservissement ont-ils été correctement repris ? "),
    TeamLeaderQuestionModel(id: 34, questionAsked: "Cohérence entre le calibre des fusibles et la réglage disjoncteur et le MODOP ?"),
    TeamLeaderQuestionModel(
        id: 35,
        questionAsked:
        "bis.Si le technicien a été perturbé pendant le déroulement de son intervention (intervention d'un tiers, nécessité de retourner chercher un matériel), a-t-il réalisé un point d'arrêt avant de reprendre celle-ci ?"),
    TeamLeaderQuestionModel(id: 36, questionAsked: "Le technicien vérifie-t-il les tensions au niveau du bornier puissance du compteur ?"),
    TeamLeaderQuestionModel(id: 37, questionAsked: "Les platoscellés ont-ils correctement été posés / reposés sur les matériels appropriés ?"),
    TeamLeaderQuestionModel(id: 38, questionAsked: "A l'issue de l'intervention, le panneau de comptage est-il conforme ?"),
    TeamLeaderQuestionModel(
        id: 39, questionAsked: "bis. Le technicien vérifie-t-il les asservissements en l'absence d'accès à l'installation du client ? "),
    TeamLeaderQuestionModel(id: 40, questionAsked: "Le technicien a-t-il réalisé l'intervention sans dégradation ?"),
    TeamLeaderQuestionModel(id: 41, questionAsked: "Le technicien laisse-t-il le lieu aussi propre qu'il l'a trouvé ?"),
    TeamLeaderQuestionModel(id: 42, questionAsked: "Le technicien a-t-il récupéré le matériel déposé au terme de l'intervention ?"),
    TeamLeaderQuestionModel(id: 43, questionAsked: "Le technicien a-t-il déposé ou remis et commenté l'enveloppe Linky ? "),
    TeamLeaderQuestionModel(id: 44, questionAsked: "Le technicien à trier ses déchets et les éléments recyclables ?"),
    TeamLeaderQuestionModel(id: 45, questionAsked: "L'analyse de GRIP est-elle conforme (notation en phase avec la réalité)"),
  ];

  ///Simultanee -> Client Absent -> Meter Not Accessible (39 Q).
  static List<TeamLeaderQuestionModel> _list6 = [
    TeamLeaderQuestionModel(
        id: 1,
        questionAsked:
        "Le véhicule ou engin (PEMP) du technicien et son stationnement respectent t-ils les règles de sécurités ? L'emplacement du véhiculepermet-il de limiter le risque plain-pied pour le technicien ? Le balisage/signalisation du chantier est-il présent et en bon état ?"),
    TeamLeaderQuestionModel(id: 2, questionAsked: "Les éléments visuels sont-ils présents et visibles (Badge et Stickers) ?"),
    TeamLeaderQuestionModel(
      id: 3,
      questionAsked:
      "Le technicien dispose-t-il des habilitations nécessaires ( vérifier les domaines), de son totre de qualification, ainsi que des ITST et des IPS en vigueurs localement ? En cas d'utilisation d'une PEMP (Plates-formes Elévatrices Mobiles de Personnes): Le technicien est-il en possession de son CACES ou de son autorisation de conduite (AC) ?",
    ),
    TeamLeaderQuestionModel(
        id: 4, questionAsked: "Le technicien respecte-t-il les gestes barrières et les préconisations pour lutter contre la pandémie du COVID-19 ?"),
    TeamLeaderQuestionModel(
        id: 5,
        questionAsked:
        "Avant de vérifier la présence du client, le technicien a-t-il préparé le type de matériel adéquat pour réaliser son intervention ?"),
    TeamLeaderQuestionModel(
        id: 6, questionAsked: "Le technicien a-t-il vérifié la préssence / absence du client avant de commencer son intervention ?"),
    TeamLeaderQuestionModel(
        id: 7,
        questionAsked:
        "Avant toute opération de travail (électrique, déplacements, manutention, relation client), le technicien réalise t-il un TOP complet ?"),
    TeamLeaderQuestionModel(id: 8, questionAsked: "L'analyse de GRIP est elle conforme (notation en phase avec la réalité) ?"),
    TeamLeaderQuestionModel(
        id: 9,
        questionAsked: "Le technicien s'assure t-il de la véracité des informations concernant le compteur en place (situation et accessibilité) ?"),
    TeamLeaderQuestionModel(
        id: 10, questionAsked: "Avant d'intervenir le technicien s'assure t'il que le matricule comteur correspond-il au nom du client associé ?"),
    TeamLeaderQuestionModel(
        id: 11,
        questionAsked:
        "L'acheminement des compteurs et des matériels annexes est-il réalisé de sorte à assurer leur non dégradation et limiter le risque de manutention manuelle ?"),
    TeamLeaderQuestionModel(
        id: 12,
        questionAsked:
        "Le technicien optimise-t-il ses déplacements en alliant et en quittant le lieu de l'intervention pour éviter les risques d'accident de plain-pied ? Le poseur organise t-il son lieu d'intervention de manière à limiter le risque plain-pied ?"),
    TeamLeaderQuestionModel(
        id: 13,
        questionAsked:
        "Le technicien porte-t-il ses équipements de protection individuelle (EPI) adaptés à la situation de travail ou de manœuvre ? Celui-ci vérifie t-il l'état de ses EPI avant l'utilisation ?"),
    TeamLeaderQuestionModel(
        id: 14,
        questionAsked:
        "La reléve des index et la déconnexion des fils BTR pour un CBE (pose de ScotchLock) ont-ils été réalisés en cohérence avec le MODOP ?"),
    TeamLeaderQuestionModel(id: 15, questionAsked: "Les gants TST du poseurs sont-ils conformes et en bon état ?"),
    TeamLeaderQuestionModel(
        id: 16, questionAsked: "Le technicien a-t-il vérifié la position de la phase avant la pose du Linky (dans le respect du mode opératoire)?"),
    TeamLeaderQuestionModel(id: 17, questionAsked: "Le technicien réalise-t-il son intervention avec un outillage adapté et en bon état apparent ?"),
    TeamLeaderQuestionModel(id: 18, questionAsked: "Le détecteur d'absence de tension a-t-il été vérifié ?"),
    TeamLeaderQuestionModel(
        id: 19,
        questionAsked:
        "Le technicien a-t-il réalisé ou fait réaliser la consignation en amont du compteur dans le respect du mode opératoire et le cas échéant des IPS/ITST adéquates ?"),
    TeamLeaderQuestionModel(id: 20, questionAsked: "Le technicien a-t-il posé autant de macaron C11 que nécessaire ?"),
    TeamLeaderQuestionModel(id: 21, questionAsked: "Le technicien a-t-il respecté la procédure en cas de neutre non déconnectable ?"),
    TeamLeaderQuestionModel(
        id: 22,
        questionAsked:
        "Le technicien a-t-il vérifié que le disjoncteur était accessible pour enlever la charge côté client ou, dans le cas contraire, a-t-il mis en place l'accessoire de consignation spécifique ?"),
    TeamLeaderQuestionModel(id: 23, questionAsked: "bis. Le technicien respecte t-il les consignes concernant la pose du kit H/B ?"),
    TeamLeaderQuestionModel(
        id: 24, questionAsked: "Si les fils de puissance sont souples (multibrins) et non sertis, des embouts ont-ils été posés ?"),
    TeamLeaderQuestionModel(id: 25, questionAsked: "Le matériel posé est-il conforme et en bon état ?"),
    TeamLeaderQuestionModel(id: 26, questionAsked: "Le technicien s'est-il assuré du bon serrage des fils du compteur ?"),
    TeamLeaderQuestionModel(
        id: 27,
        questionAsked:
        "Le compteur Linky est-il bien fixé, correctement orienté et ne gênant pas la fermeture de la porte (coffret ou gaine) le cas échéant ?"),
    TeamLeaderQuestionModel(id: 28, questionAsked: "Les fils d'asservissement ont-ils été correctement repris ? "),
    TeamLeaderQuestionModel(id: 29, questionAsked: "Cohérence entre le calibre des fusibles et la réglage disjoncteur et le MODOP ?"),
    TeamLeaderQuestionModel(
        id: 30,
        questionAsked:
        "bis.Si le technicien a été perturbé pendant le déroulement de son intervention (intervention d'un tiers, nécessité de retourner chercher un matériel), a-t-il réalisé un point d'arrêt avant de reprendre celle-ci ?"),
    TeamLeaderQuestionModel(id: 31, questionAsked: "Le technicien vérifie-t-il les tensions au niveau du bornier puissance du compteur ?"),
    TeamLeaderQuestionModel(id: 32, questionAsked: "Les platoscellés ont-ils correctement été posés / reposés sur les matériels appropriés ?"),
    TeamLeaderQuestionModel(id: 33, questionAsked: "A l'issue de l'intervention, le panneau de comptage est-il conforme ?"),
    TeamLeaderQuestionModel(
        id: 34, questionAsked: "bis. Le technicien vérifie-t-il les asservissements en l'absence d'accès à l'installation du client ? "),
    TeamLeaderQuestionModel(id: 35, questionAsked: "Le technicien laisse-t-il le lieu aussi propre qu'il l'a trouvé ?"),
    TeamLeaderQuestionModel(id: 36, questionAsked: "Le technicien a-t-il récupéré le matériel déposé au terme de l'intervention ?"),
    TeamLeaderQuestionModel(id: 37, questionAsked: "Le technicien a-t-il déposé ou remis et commenté l'enveloppe Linky ? "),
    TeamLeaderQuestionModel(id: 38, questionAsked: "Le technicien à trier ses déchets et les éléments recyclables ?"),
    TeamLeaderQuestionModel(id: 39, questionAsked: "L'analyse de GRIP est-elle conforme (notation en phase avec la réalité)"),
  ];

  ///Simultanee -> Client Present -> Meter Accessible (56 Q).
  static List<TeamLeaderQuestionModel> _list7 = [
    TeamLeaderQuestionModel(
        id: 1,
        questionAsked:
        "Le véhicule ou engin (PEMP) du technicien et son stationnement respectent t-ils les règles de sécurités ? L'emplacement du véhiculepermet-il de limiter le risque plain-pied pour le technicien ? Le balisage/signalisation du chantier est-il présent et en bon état ?"),
    TeamLeaderQuestionModel(id: 2, questionAsked: "Les éléments visuels sont-ils présents et visibles (Badge et Stickers) ?"),
    TeamLeaderQuestionModel(
      id: 3,
      questionAsked:
      "Le technicien dispose-t-il des habilitations nécessaires ( vérifier les domaines), de son totre de qualification, ainsi que des ITST et des IPS en vigueurs localement ? En cas d'utilisation d'une PEMP (Plates-formes Elévatrices Mobiles de Personnes): Le technicien est-il en possession de son CACES ou de son autorisation de conduite (AC) ?",
    ),
    TeamLeaderQuestionModel(
        id: 4, questionAsked: "Le technicien respecte-t-il les gestes barrières et les préconisations pour lutter contre la pandémie du COVID-19 ?"),
    TeamLeaderQuestionModel(id: 5, questionAsked: "L'intervention respecte-t-elle bien le créneau horaire prévue ?"),
    TeamLeaderQuestionModel(id: 6, questionAsked: "Le technicien veille t-il au respect du RDV client ?"),
    TeamLeaderQuestionModel(
        id: 7,
        questionAsked:
        "Avant de vérifier la présence du client, le technicien a-t-il préparé le type de matériel adéquat pour réaliser son intervention ?"),
    TeamLeaderQuestionModel(
        id: 8, questionAsked: "Le technicien a-t-il vérifié la préssence / absence du client avant de commencer son intervention ?"),
    TeamLeaderQuestionModel(
        id: 9,
        questionAsked:
        "Le technicien a-t-il expliqué le but et le déroulement de l'intervention au client tout en respectant le Code de la bonne conduite ?"),
    TeamLeaderQuestionModel(
        id: 10,
        questionAsked:
        "Avant toute opération de travail (électrique, déplacements, manutention, relation client), le technicien réalise t-il un TOP complet ?"),
    TeamLeaderQuestionModel(id: 11, questionAsked: "L'analyse de GRIP est elle conforme (notation en phase avec la réalité) ?"),
    TeamLeaderQuestionModel(
        id: 12,
        questionAsked: "Le technicien s'assure t-il de la véracité des informations concernant le compteur en place (situation et accessibilité) ?"),
    TeamLeaderQuestionModel(
        id: 13, questionAsked: "Avant d'intervenir le technicien s'assure t'il que le matricule comteur correspond-il au nom du client associé ?"),
    TeamLeaderQuestionModel(
        id: 14,
        questionAsked:
        "L'acheminement des compteurs et des matériels annexes est-il réalisé de sorte à assurer leur non dégradation et limiter le risque de manutention manuelle ?"),
    TeamLeaderQuestionModel(
        id: 15,
        questionAsked:
        "Le technicien optimise-t-il ses déplacements en alliant et en quittant le lieu de l'intervention pour éviter les risques d'accident de plain-pied ? Le poseur organise t-il son lieu d'intervention de manière à limiter le risque plain-pied ?"),
    TeamLeaderQuestionModel(
        id: 16,
        questionAsked: "Le technicien s'est-il assuré que le client n'est pas PHRV ou, dans le cas contraire, a-t-il respécté la procédure ?"),
    TeamLeaderQuestionModel(
        id: 17,
        questionAsked:
        "Le technicien a-til demandé au client de couper ses appareils éléctriques sensibles et l'autorisation de procéder à la coupure avant de mettre l'installation hots tension? "),
    TeamLeaderQuestionModel(
        id: 18,
        questionAsked:
        "Le technicien porte-t-il ses équipements de protection individuelle (EPI) adaptés à la situation de travail ou de manœuvre ? Celui-ci vérifie t-il l'état de ses EPI avant l'utilisation ?"),
    TeamLeaderQuestionModel(
        id: 19,
        questionAsked:
        "La reléve des index et la déconnexion des fils BTR pour un CBE (pose de ScotchLock) ont-ils été réalisés en cohérence avec le MODOP ?"),
    TeamLeaderQuestionModel(id: 20, questionAsked: "Les gants TST du poseurs sont-ils conformes et en bon état ?"),
    TeamLeaderQuestionModel(id: 21, questionAsked: "Le technicien réalise-t-il le test du disjoncteur dans le respect du mode opératoire ?"),
    TeamLeaderQuestionModel(id: 22, questionAsked: "Le technicien a-t-il collecté les caractéristiques du disjoncteur ?"),
    TeamLeaderQuestionModel(
        id: 23,
        questionAsked:
        "Le technicien a-t-il vérifié que le disjoncteur était fonctionnel et, si celui-ci est défectueux, a-t-il procédé à son remplacement ?"),
    TeamLeaderQuestionModel(
        id: 24,
        questionAsked:
        "Si il y a un décalage entre la puissance souscrite et le réglage actuel du disjoncteur le technicien explique t-il la situation au client ?"),
    TeamLeaderQuestionModel(
        id: 25, questionAsked: "Le technicien a-t-il vérifié la position de la phase avant la pose du Linky (dans le respect du mode opératoire)?"),
    TeamLeaderQuestionModel(id: 26, questionAsked: "Le technicien réalise-t-il son intervention avec un outillage adapté et en bon état apparent ?"),
    TeamLeaderQuestionModel(id: 27, questionAsked: "Le détecteur d'absence de tension a-t-il été vérifié ?"),
    TeamLeaderQuestionModel(
        id: 28,
        questionAsked:
        "Le technicien a-t-il réalisé ou fait réaliser la consignation en amont du compteur dans le respect du mode opératoire et le cas échéant des IPS/ITST adéquates ?"),
    TeamLeaderQuestionModel(
        id: 29,
        questionAsked:
        "Le technicien a-t-il réalisé la consignation de l'installation côté disjoncteur, dans le respect du mode opératoire et le cas échéant des IPS/ITST adéquates ?"),
    TeamLeaderQuestionModel(id: 30, questionAsked: "Le technicien a-t-il posé autant de macaron C11 que nécessaire ?"),
    TeamLeaderQuestionModel(id: 31, questionAsked: "Le technicien a-t-il respecté la procédure en cas de neutre non déconnectable ?"),
    TeamLeaderQuestionModel(
        id: 32,
        questionAsked:
        "Le technicien a-t-il vérifié que le disjoncteur était accessible pour enlever la charge côté client ou, dans le cas contraire, a-t-il mis en place l'accessoire de consignation spécifique ?"),
    TeamLeaderQuestionModel(id: 33, questionAsked: "bis. Le technicien respecte t-il les consignes concernant la pose du kit H/B ?"),
    TeamLeaderQuestionModel(
        id: 34, questionAsked: "Si les fils de puissance sont souples (multibrins) et non sertis, des embouts ont-ils été posés ?"),
    TeamLeaderQuestionModel(id: 35, questionAsked: "Le matériel posé est-il conforme et en bon état ?"),
    TeamLeaderQuestionModel(id: 36, questionAsked: "Le technicien s'est-il assuré du bon serrage des fils du compteur ?"),
    TeamLeaderQuestionModel(
        id: 37,
        questionAsked:
        "Le compteur Linky est-il bien fixé, correctement orienté et ne gênant pas la fermeture de la porte (coffret ou gaine) le cas échéant ?"),
    TeamLeaderQuestionModel(
        id: 38,
        questionAsked: "Avant remise sous tension, le technicien réalise-t-il une vérification d'absence de court circuit entre phase et neutre ?"),
    TeamLeaderQuestionModel(id: 39, questionAsked: "Les fils d'asservissement ont-ils été correctement repris ? "),
    TeamLeaderQuestionModel(id: 40, questionAsked: "Cohérence entre le calibre des fusibles et la réglage disjoncteur et le MODOP ?"),
    TeamLeaderQuestionModel(
        id: 41,
        questionAsked:
        "bis.Si le technicien a été perturbé pendant le déroulement de son intervention (intervention d'un tiers, nécessité de retourner chercher un matériel), a-t-il réalisé un point d'arrêt avant de reprendre celle-ci ?"),
    TeamLeaderQuestionModel(id: 42, questionAsked: "Le technicien vérifie-t-il les tensions au niveau du bornier puissance du compteur ?"),
    TeamLeaderQuestionModel(id: 43, questionAsked: "Les platoscellés ont-ils correctement été posés / reposés sur les matériels appropriés ?"),
    TeamLeaderQuestionModel(id: 44, questionAsked: "A l'issue de l'intervention, le panneau de comptage est-il conforme ?"),
    TeamLeaderQuestionModel(id: 45, questionAsked: "Le technicien informe-t-il le client de la remise sous tension ?"),
    TeamLeaderQuestionModel(
        id: 46, questionAsked: "Le technicien vérifie-t-illes asservissements en fonction de l'accessibilité de l'installation du client ?"),
    TeamLeaderQuestionModel(
        id: 47, questionAsked: "bis. Le technicien vérifie-t-il les asservissements en l'absence d'accès à l'installation du client ? "),
    TeamLeaderQuestionModel(id: 48, questionAsked: "Le technicien a-t-il réalisé l'intervention sans dégradation ?"),
    TeamLeaderQuestionModel(
        id: 49,
        questionAsked:
        "Durant son intervention, le technicien a-t-il maîtrisé les éléments de langage ENEDIS/Linky face au client en appliquant le Code de bonne Conduite ?"),
    TeamLeaderQuestionModel(id: 50, questionAsked: "Le technicien a-t-il fait valider les index de dépose au client ?"),
    TeamLeaderQuestionModel(id: 51, questionAsked: "Le technicien laisse-t-il le lieu aussi propre qu'il l'a trouvé ?"),
    TeamLeaderQuestionModel(id: 52, questionAsked: "Le technicien a-t-il récupéré le matériel déposé au terme de l'intervention ?"),
    TeamLeaderQuestionModel(id: 53, questionAsked: "Le technicien a-t-il déposé ou remis et commenté l'enveloppe Linky ? "),
    TeamLeaderQuestionModel(id: 54, questionAsked: "Le technicien a-t-il correctement expliqué le fonctionnement du compteur Linky au client ?"),
    TeamLeaderQuestionModel(id: 55, questionAsked: "Le technicien à trier ses déchets et les éléments recyclables ?"),
    TeamLeaderQuestionModel(id: 56, questionAsked: "L'analyse de GRIP est-elle conforme (notation en phase avec la réalité)"),
  ];

  ///Simultanee -> Client Present -> Meter Not Accessible (49 Q).
  static List<TeamLeaderQuestionModel> _list8 = [
    TeamLeaderQuestionModel(
        id: 1,
        questionAsked:
        "Le véhicule ou engin (PEMP) du technicien et son stationnement respectent t-ils les règles de sécurités ? L'emplacement du véhiculepermet-il de limiter le risque plain-pied pour le technicien ? Le balisage/signalisation du chantier est-il présent et en bon état ?"),
    TeamLeaderQuestionModel(id: 2, questionAsked: "Les éléments visuels sont-ils présents et visibles (Badge et Stickers) ?"),
    TeamLeaderQuestionModel(
      id: 3,
      questionAsked:
      "Le technicien dispose-t-il des habilitations nécessaires ( vérifier les domaines), de son totre de qualification, ainsi que des ITST et des IPS en vigueurs localement ? En cas d'utilisation d'une PEMP (Plates-formes Elévatrices Mobiles de Personnes): Le technicien est-il en possession de son CACES ou de son autorisation de conduite (AC) ?",
    ),
    TeamLeaderQuestionModel(
        id: 4, questionAsked: "Le technicien respecte-t-il les gestes barrières et les préconisations pour lutter contre la pandémie du COVID-19 ?"),
    TeamLeaderQuestionModel(id: 5, questionAsked: "L'intervention respecte-t-elle bien le créneau horaire prévue ?"),
    TeamLeaderQuestionModel(id: 6, questionAsked: "Le technicien veille t-il au respect du RDV client ?"),
    TeamLeaderQuestionModel(
        id: 7,
        questionAsked:
        "Avant de vérifier la présence du client, le technicien a-t-il préparé le type de matériel adéquat pour réaliser son intervention ?"),
    TeamLeaderQuestionModel(
        id: 8, questionAsked: "Le technicien a-t-il vérifié la préssence / absence du client avant de commencer son intervention ?"),
    TeamLeaderQuestionModel(
        id: 9,
        questionAsked:
        "Le technicien a-t-il expliqué le but et le déroulement de l'intervention au client tout en respectant le Code de la bonne conduite ?"),
    TeamLeaderQuestionModel(
        id: 10,
        questionAsked:
        "Avant toute opération de travail (électrique, déplacements, manutention, relation client), le technicien réalise t-il un TOP complet ?"),
    TeamLeaderQuestionModel(id: 11, questionAsked: "L'analyse de GRIP est elle conforme (notation en phase avec la réalité) ?"),
    TeamLeaderQuestionModel(
        id: 12,
        questionAsked: "Le technicien s'assure t-il de la véracité des informations concernant le compteur en place (situation et accessibilité) ?"),
    TeamLeaderQuestionModel(
        id: 13, questionAsked: "Avant d'intervenir le technicien s'assure t'il que le matricule comteur correspond-il au nom du client associé ?"),
    TeamLeaderQuestionModel(
        id: 14,
        questionAsked:
        "L'acheminement des compteurs et des matériels annexes est-il réalisé de sorte à assurer leur non dégradation et limiter le risque de manutention manuelle ?"),
    TeamLeaderQuestionModel(
        id: 15,
        questionAsked:
        "Le technicien optimise-t-il ses déplacements en alliant et en quittant le lieu de l'intervention pour éviter les risques d'accident de plain-pied ? Le poseur organise t-il son lieu d'intervention de manière à limiter le risque plain-pied ?"),
    TeamLeaderQuestionModel(
        id: 16,
        questionAsked: "Le technicien s'est-il assuré que le client n'est pas PHRV ou, dans le cas contraire, a-t-il respécté la procédure ?"),
    TeamLeaderQuestionModel(
        id: 17,
        questionAsked:
        "Le technicien a-til demandé au client de couper ses appareils éléctriques sensibles et l'autorisation de procéder à la coupure avant de mettre l'installation hots tension? "),
    TeamLeaderQuestionModel(
        id: 18,
        questionAsked:
        "Le technicien porte-t-il ses équipements de protection individuelle (EPI) adaptés à la situation de travail ou de manœuvre ? Celui-ci vérifie t-il l'état de ses EPI avant l'utilisation ?"),
    TeamLeaderQuestionModel(
        id: 19,
        questionAsked:
        "La reléve des index et la déconnexion des fils BTR pour un CBE (pose de ScotchLock) ont-ils été réalisés en cohérence avec le MODOP ?"),
    TeamLeaderQuestionModel(id: 20, questionAsked: "Les gants TST du poseurs sont-ils conformes et en bon état ?"),
    TeamLeaderQuestionModel(
        id: 21, questionAsked: "Le technicien a-t-il vérifié la position de la phase avant la pose du Linky (dans le respect du mode opératoire)?"),
    TeamLeaderQuestionModel(id: 22, questionAsked: "Le technicien réalise-t-il son intervention avec un outillage adapté et en bon état apparent ?"),
    TeamLeaderQuestionModel(id: 23, questionAsked: "Le détecteur d'absence de tension a-t-il été vérifié ?"),
    TeamLeaderQuestionModel(
        id: 24,
        questionAsked:
        "Le technicien a-t-il réalisé ou fait réaliser la consignation en amont du compteur dans le respect du mode opératoire et le cas échéant des IPS/ITST adéquates ?"),
    TeamLeaderQuestionModel(id: 25, questionAsked: "Le technicien a-t-il posé autant de macaron C11 que nécessaire ?"),
    TeamLeaderQuestionModel(id: 26, questionAsked: "Le technicien a-t-il respecté la procédure en cas de neutre non déconnectable ?"),
    TeamLeaderQuestionModel(
        id: 27,
        questionAsked:
        "Le technicien a-t-il vérifié que le disjoncteur était accessible pour enlever la charge côté client ou, dans le cas contraire, a-t-il mis en place l'accessoire de consignation spécifique ?"),
    TeamLeaderQuestionModel(id: 28, questionAsked: "bis. Le technicien respecte t-il les consignes concernant la pose du kit H/B ?"),
    TeamLeaderQuestionModel(
        id: 29, questionAsked: "Si les fils de puissance sont souples (multibrins) et non sertis, des embouts ont-ils été posés ?"),
    TeamLeaderQuestionModel(id: 30, questionAsked: "Le matériel posé est-il conforme et en bon état ?"),
    TeamLeaderQuestionModel(id: 31, questionAsked: "Le technicien s'est-il assuré du bon serrage des fils du compteur ?"),
    TeamLeaderQuestionModel(
        id: 32,
        questionAsked:
        "Le compteur Linky est-il bien fixé, correctement orienté et ne gênant pas la fermeture de la porte (coffret ou gaine) le cas échéant ?"),
    TeamLeaderQuestionModel(id: 33, questionAsked: "Les fils d'asservissement ont-ils été correctement repris ? "),
    TeamLeaderQuestionModel(
        id: 34,
        questionAsked:
        "bis.Si le technicien a été perturbé pendant le déroulement de son intervention (intervention d'un tiers, nécessité de retourner chercher un matériel), a-t-il réalisé un point d'arrêt avant de reprendre celle-ci ?"),
    TeamLeaderQuestionModel(id: 35, questionAsked: "Le technicien vérifie-t-il les tensions au niveau du bornier puissance du compteur ?"),
    TeamLeaderQuestionModel(id: 36, questionAsked: "Les platoscellés ont-ils correctement été posés / reposés sur les matériels appropriés ?"),
    TeamLeaderQuestionModel(id: 37, questionAsked: "A l'issue de l'intervention, le panneau de comptage est-il conforme ?"),
    TeamLeaderQuestionModel(id: 38, questionAsked: "Le technicien informe-t-il le client de la remise sous tension ?"),
    TeamLeaderQuestionModel(
        id: 39, questionAsked: "Le technicien vérifie-t-illes asservissements en fonction de l'accessibilité de l'installation du client ?"),
    TeamLeaderQuestionModel(
        id: 40, questionAsked: "bis. Le technicien vérifie-t-il les asservissements en l'absence d'accès à l'installation du client ? "),
    TeamLeaderQuestionModel(id: 41, questionAsked: "Le technicien a-t-il réalisé l'intervention sans dégradation ?"),
    TeamLeaderQuestionModel(
        id: 42,
        questionAsked:
        "Durant son intervention, le technicien a-t-il maîtrisé les éléments de langage ENEDIS/Linky face au client en appliquant le Code de bonne Conduite ?"),
    TeamLeaderQuestionModel(id: 43, questionAsked: "Le technicien a-t-il fait valider les index de dépose au client ?"),
    TeamLeaderQuestionModel(id: 44, questionAsked: "Le technicien laisse-t-il le lieu aussi propre qu'il l'a trouvé ?"),
    TeamLeaderQuestionModel(id: 45, questionAsked: "Le technicien a-t-il récupéré le matériel déposé au terme de l'intervention ?"),
    TeamLeaderQuestionModel(id: 46, questionAsked: "Le technicien a-t-il déposé ou remis et commenté l'enveloppe Linky ? "),
    TeamLeaderQuestionModel(id: 47, questionAsked: "Le technicien a-t-il correctement expliqué le fonctionnement du compteur Linky au client ?"),
    TeamLeaderQuestionModel(id: 48, questionAsked: "Le technicien à trier ses déchets et les éléments recyclables ?"),
    TeamLeaderQuestionModel(id: 49, questionAsked: "L'analyse de GRIP est-elle conforme (notation en phase avec la réalité)"),
  ];

  /// The function [setQuestionsAnswersOfTeamLeaderForList1] will update the answers for list 1 and simillarly for every list
  void setQuestionsAnswersOfTeamLeaderForList1(List<TeamLeaderQuestionModel> questionsList1) => _list1 = questionsList1;
  void setQuestionsAnswersOfTeamLeaderForList2(List<TeamLeaderQuestionModel> questionsList2) => _list2 = questionsList2;
  void setQuestionsAnswersOfTeamLeaderForList3(List<TeamLeaderQuestionModel> questionsList3) => _list3 = questionsList3;
  void setQuestionsAnswersOfTeamLeaderForList4(List<TeamLeaderQuestionModel> questionsList4) => _list4 = questionsList4;
  void setQuestionsAnswersOfTeamLeaderForList5(List<TeamLeaderQuestionModel> questionsList5) => _list5 = questionsList5;
  void setQuestionsAnswersOfTeamLeaderForList6(List<TeamLeaderQuestionModel> questionsList6) => _list6 = questionsList6;
  void setQuestionsAnswersOfTeamLeaderForList7(List<TeamLeaderQuestionModel> questionsList7) => _list7 = questionsList7;
  void setQuestionsAnswersOfTeamLeaderForList8(List<TeamLeaderQuestionModel> questionsList8) => _list8 = questionsList8;

  // Returning List1 of question-answers and similarly for every list
  ///A Posteriori -> Client Absent -> Meter Accessible (16 Q).
  List<TeamLeaderQuestionModel> get getQuestionsAnswersOfTeamLeaderForList1 => _list1;

  ///A Posteriori -> Client Absent -> Meter Not Accessible (13 Q).
  List<TeamLeaderQuestionModel> get getQuestionsAnswersOfTeamLeaderForList2 => _list2;

  ///A Posteriori -> Client Present -> Meter Accessible (20 Q).
  List<TeamLeaderQuestionModel> get getQuestionsAnswersOfTeamLeaderForList3 => _list3;

  ///A Posteriori -> Client Present -> Meter Not Accessible (17 Q).
  List<TeamLeaderQuestionModel> get getQuestionsAnswersOfTeamLeaderForList4 => _list4;

  ///Simultanee -> Client Absent -> Meter Accessible (45 Q).
  List<TeamLeaderQuestionModel> get getQuestionsAnswersOfTeamLeaderForList5 => _list5;

  ///Simultanee -> Client Absent -> Meter Not Accessible (39 Q).
  List<TeamLeaderQuestionModel> get getQuestionsAnswersOfTeamLeaderForList6 => _list6;

  ///Simultanee -> Client Present -> Meter Accessible (56 Q).
  List<TeamLeaderQuestionModel> get getQuestionsAnswersOfTeamLeaderForList7 => _list7;

  ///Simultanee -> Client Present -> Meter Not Accessible (49 Q).
  List<TeamLeaderQuestionModel> get getQuestionsAnswersOfTeamLeaderForList8 => _list8;
}