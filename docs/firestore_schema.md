# Firestore - schéma MVP

Collections prévues :

## users
- name
- email
- country
- city
- photoUrl
- bio
- careerGoal
- skills: [{ name, level, verified }]
- createdAt

## skills
- name
- category

## projects
- userId
- title
- description
- technologies
- githubUrl
- imageUrl
- createdAt

## opportunities
- title
- company
- country
- city
- type
- description
- requiredSkills
- remote
- createdAt

## applications
- userId
- opportunityId
- status
- createdAt

## skillGaps
- userId
- targetRole
- missingSkills
- recommendations
- createdAt

## matches
- userId
- opportunityId
- score
- matchedSkills
- missingSkills
- createdAt
