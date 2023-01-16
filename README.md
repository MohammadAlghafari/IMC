# imc
A new Flutter project.
## Getting Started
A few resources to get you started.
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Here are the XD Links
Technicien Mobile XD Design : https://xd.adobe.com/view/22e1c876-4868-4446-8e41-cc36d14152aa-77b2/
Team Lead Mobile XD Design : https://xd.adobe.com/view/08ef3fcd-183b-4c61-ba46-caa83aaa58ae-5dbc/
SuperAdmin XD Design : https://xd.adobe.com/view/25ada7d3-9651-4329-b522-0b7f6544df0a-70fe/
Technicien Mobile XD Design EN : https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/
New Technicien Mobile XD Design EN  : https://xd.adobe.com/view/8d13c493-69c1-411b-b3d1-05bf6eda638c-d840/
Team Lead Mobile XD Design EN : https://xd.adobe.com/view/e772d555-72dc-4837-90cc-925722439607-b221/

------------

API Usage :
All the API endpoints are available in the file **api_routes.dart**

------------

**Endpoint 1.** -"/v1/login"

**Functionality** : login the user with given email and password

**Endpoint 2.** - "/oauth/token"

**Functionality** : return us the initial refresh token

**Usage Screen**
[XD Link](http://xd.adobe.com/view/8d13c493-69c1-411b-b3d1-05bf6eda638c-d840/screen/2488db59-7502-40f3-9966-603064e56916/ "XD Link")

------------
***Technician APIs***
------------

**Endpoint** - "/v1/technicien/interventions/date-range"<br>

**Functionality** : return the list of intervention of a technician for a particular date range

**Usage Screen**
[XD Link](https://xd.adobe.com/view/8d13c493-69c1-411b-b3d1-05bf6eda638c-d840/screen/c2701edf-7cac-4bc4-bbad-9d3fd10f7fde/)

------------

**Endpoint** -"/v1/technicien/interventions/date-range"

**Functionality** : return the list of intervention of a technician for a particular date range

**Usage Screen**<br>
[1. Planning Month UI Link](https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/screen/c2701edf-7cac-4bc4-bbad-9d3fd10f7fde/ "Planning Month UI Link")<br>
[2. Planning Week UI Link](https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/screen/06b0825d-40aa-4753-949a-3166af06cd5f/ "Planning Week UI Link")<br>
[3. Planning Day UI Link](https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/screen/f342b533-8bdd-4836-aaa0-a255a839d160/ "Planning Day UI Link")
<br>

------------

**Endpoint** - "/v1/technicien/interventions/map"

**Functionality** : return the list of intervention of a technician on a map for a today

**Usage Screen**
[XD Link](https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/screen/974cdc25-f618-4987-aa77-07c48fe821be/)

------------

**Endpoint** - "/v1/client/tech_marque"

**Functionality** : This returns us a list of tech marques

**Usage Screen**
[XD Link](https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/screen/4e124d8d-bf71-4375-9140-63e666883730/)

------------

**Endpoint** - "/v1/technicien/intervention/{interventionId}/update-status"

**Functionality** : This will update the intervention status

**Usage Screen**
[XD Link](https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/screen/b65a5d1f-cf03-4e9d-a5ea-2697cd0a6f0e/)

------------

**Endpoint** - "/v1/technicien/intervention/{interventionId}/end"

**Functionality** : This will end the intervention for the technician with the provided intervention id.

**Usage Screen**
[XD Link](https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/screen/b65a5d1f-cf03-4e9d-a5ea-2697cd0a6f0e/)

------------
**Endpoint** - "/v1/technicien/intervention/{interventionId}/history"

**Functionality** : will return all the interventions history for the given interventonId

**Usage Screen**
[XD Link](https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/screen/1e12703d-f61e-4b1f-9263-64a2fea2454d/)

------------
**Endpoint** : "https://imc.itfaq.cloud/public/uploads/interventions{interventionPdf}"

**Functionality** : will download pdf

**Usage Screen**
[XD Link](https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/screen/1e12703d-f61e-4b1f-9263-64a2fea2454d/)

------------
**Endpoint** - "v1/technicien/interventions/analytics-week"

**Functionality** : will get the analytics week data for the given month, year

**Usage Screen**
[XD Link](https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/screen/abb12c6d-7ca7-4a46-b1df-c5ce3efb2ac1/)

------------
**Endpoint** - "v1/technicien/interventions/analytics-time"

**Functionality** : will get the analytics time data for the given month, year

**Usage Screen**
[XD Link](https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/screen/abb12c6d-7ca7-4a46-b1df-c5ce3efb2ac1/)

***Team Leader APIs***
------------
**Endpoint** - "v1/teamleader/interventions/status/count"

**Functionality** : will get  total of interventions count for the team leader

**Usage Screen**
[XD Link](https://xd.adobe.com/view/08ef3fcd-183b-4c61-ba46-caa83aaa58ae-5dbc/screen/8dbe369b-4e16-4f56-a698-403b8f6f6726/)

------------
**Endpoint** - "v1/teamleader/team-members"

**Functionality** : will get  team members for the team leader

**Usage Screen**
[XD Link](https://xd.adobe.com/view/08ef3fcd-183b-4c61-ba46-caa83aaa58ae-5dbc/screen/8dbe369b-4e16-4f56-a698-403b8f6f6726/)

------------
**Endpoint** - "v1/teamleader/interventions/intervention_ongoing"

**Functionality** : will get the ongoing interventions for the team leader

**Usage Screen**
[XD Link](https://xd.adobe.com/view/08ef3fcd-183b-4c61-ba46-caa83aaa58ae-5dbc/screen/8dbe369b-4e16-4f56-a698-403b8f6f6726/)

------------
**Endpoint** - "v1/teamleader/team-member-interventions/data-range/status"

**Functionality** : will get the interventions for the technician working under the team leader

**Usage Screen**
[XD Link](https://xd.adobe.com/view/08ef3fcd-183b-4c61-ba46-caa83aaa58ae-5dbc/screen/33bf5a36-a513-4b5d-a818-7c36a7e6e81a/)

------------
**Endpoint** - "v1/teamleader/visits/date-range/status"

**Functionality** : will get the interventions of the team leader

**Usage Screen**<br>
[1. Planning Month UI Link](https://xd.adobe.com/view/08ef3fcd-183b-4c61-ba46-caa83aaa58ae-5dbc/screen/6a58e21c-9544-459e-b0e8-97dba24430dd/ "Planning Month UI Link")<br>
[2. Planning Week UI Link](https://xd.adobe.com/view/08ef3fcd-183b-4c61-ba46-caa83aaa58ae-5dbc/screen/f3acddb6-3d24-4418-a863-309c600531a9/ "Planning Week UI Link")<br>
[3. Planning Day UI Link](https://xd.adobe.com/view/08ef3fcd-183b-4c61-ba46-caa83aaa58ae-5dbc/screen/4d067e5b-1470-450b-83b5-b6b8cff602ad/ "Planning Day UI Link")

------------
**Endpoint** - "v1/teamleader/end-visit"

**Functionality** : will end the team leader intervention visit

**Usage Screen**
[XD Link](https://xd.adobe.com/view/08ef3fcd-183b-4c61-ba46-caa83aaa58ae-5dbc/screen/2389ba62-93aa-486f-aec5-b368690eb523/)

------------
**Endpoint** - "v1/teamleader/interventions/analytics-week" 

**Functionality** : will get the analytics week data for the given month, year for the team leader

**Usage Screen**
[XD Link](https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/screen/abb12c6d-7ca7-4a46-b1df-c5ce3efb2ac1/)

------------
**Endpoint** - "v1/teamleader/interventions/analytics-time"

**Functionality** : will get the analytics time data for the given month, year for the team leader

**Usage Screen**
[XD Link](https://xd.adobe.com/view/62e7872a-5fc6-4f34-b6d0-9571dd53fded-37b4/screen/abb12c6d-7ca7-4a46-b1df-c5ce3efb2ac1/)

------------
**Endpoint** - "v1/teamleader/visits/{visitId}/history"

**Functionality** : will get all the intervention visit history for the given visitId

**Usage Screen**
[XD Link](https://xd.adobe.com/view/08ef3fcd-183b-4c61-ba46-caa83aaa58ae-5dbc/screen/3cf255ba-f4c1-4eab-a11f-f62d38410c08/)
