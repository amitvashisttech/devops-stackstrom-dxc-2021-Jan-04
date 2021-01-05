# Delivery Pipeline View Demo. 

### 1. Go to Manage Jenkins & Install Delivery Pipeline View Plugin. 

### 2. Create Couple of Sample Jobs - By Copying Test-Job-1. 

### 3. Let Inter-chain them via Build Trigger or Post Build Actions. 
```                                       
Test-Job-1 -> Test-Job-2 -> Test-Job-3 --> {Test-Job-4, Test-Job-5} Test-Job-5 --> Test-Job-6
```                                       

### 4. Clink on + Icon on Dashboard & Create new delivery PiplelineView. 
```
Name: MyView
Component
Name: Test-Job
Initail Job Name: Test-Job-1

```
