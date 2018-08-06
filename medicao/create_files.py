
def create_csv(dbFile, logFile, nameFile):
	fileDB = open(dbFile)
	fileServer = open(logFile)

	linesDB = fileDB.readlines()[0].strip().split("\\n")
	linesServer = fileServer.readlines()

	lineN = 0
	lineServer = 0
	result = "requisicaoN,tempoBanco,tempoHTTP\n"

	#print (len(linesDB)-2, len(linesServer)-1)
	for i in range(0,len(linesDB)-1,2):

		bDB = float(linesDB[i].split(",")[-1].split(" ")[0]) + float(linesDB[i].split(",")[-1].split(" ")[1])
		aDB = float(linesDB[i+1].split(",")[-1].split(" ")[0]) + float(linesDB[i+1].split(",")[-1].split(" ")[1])
		resultDB = aDB - bDB

		bServer = float(linesServer[lineServer].split(" ")[0])
		aServer = float(linesServer[lineServer+1].split(" ")[0])
		resultServer = (aServer - bServer) * (10**-9)

		while(resultServer > 8):
			#print resultServer
			lineServer += 2
			bServer = float(linesServer[lineServer].split(" ")[0])
			aServer = float(linesServer[lineServer+1].split(" ")[0])
			resultServer = (aServer - bServer) * (10**-9)

		lineN += 1

		result += "%d,%f,%f\n" % (lineN, resultDB, resultServer)

		lineServer += 2
	#print "FINAL", i+1, lineServer-1
	file = open("result/" + nameFile + ".csv" , 'w')
	file.writelines(result.strip())
	file.close()

def create_all():

	filesDb = ["1GB/dblogpost150.txt", "1GB/dblogput150.txt", "1GB/dblogpost450.txt", "1GB/dblogput450.txt", "1GB/dblogpost150_1.txt", "500MB/dblogpost150_500MB.txt", "500MB/dblogput150_500MB.txt", "500MB/dblogpost450_500MB.txt", "500MB/dblogput450_500MB.txt" , "100MB/dblogpost450_100MB.txt", "100MB/dblogpost150_100MB.txt", "100MB/dblogput450_100MB.txt", "100MB/dblogput150_100MB.txt", "dblogpost150.txt"]
	filesLog = ["1GB/requestlogpost150.txt", "1GB/requestlogput150.txt", "1GB/requestlogpost450.txt", "1GB/requestlogput450.txt", "1GB/requestlogpost150_1.txt", "500MB/requestlogpost150_500MB.txt", "500MB/requestlogput150_500MB.txt", "500MB/requestlogpost450_500MB.txt", "500MB/requestlogput450_500MB.txt", "100MB/requestlogpost450_100MB.txt", "100MB/requestlogpost150_100MB.txt", "100MB/requestlogput450_100MB.txt", "100MB/requestlogput150_100MB.txt", "requestlogpost150.txt"]
	filesName = ["1gbpost150", "1gbput150", "1gbpost450", "1gbput450", "1gbpost150_1" "500mbpost150", "500mbput150", "500mbpost450", "500mbput450", "100mbpost450", "100mbpost150", "100mbput450", "100mbput150", "logpost150"]

	for i in range(len(filesName)):
		#print filesName[i]
		if(filesName[i] not in []):
			create_csv(filesDb[i], filesLog[i], filesName[i])

create_all()
