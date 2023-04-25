
--Start of Function and Event Scope---------------------------------------------

---@param trainingImage Image
---@param trainingLabels string[]
---@param trainedOCRFilename string
local function trainOCR(trainingImage, trainingLabels, trainedOCRFilename)
  local trainingFilename = "letters.trf"
  -- Creating Halcon handle
  local hdevOCRTraining = Halcon.create()
  -- Loading OCRTraining.hdvp script into HALCON handle
  hdevOCRTraining:loadProcedure("resources/OCRTraining.hdvp")
  
  -- Setting the iconic and control input parameters of the HALCON function OCRTraining.hdvp
  hdevOCRTraining:setImage("TrainingImage", trainingImage)
  hdevOCRTraining:setString("OCRTrainingFilename", trainingFilename)
  hdevOCRTraining:setString("OCRFilename", trainedOCRFilename)
  hdevOCRTraining:setStringArray("Labels", trainingLabels)
  
  -- Executing the loaded function
  local _ = hdevOCRTraining:execute()
  File.del("public/" .. trainingFilename)
  print("Training finished, see output at public/" .. trainedOCRFilename)
end

--Declaration of the 'main' function as an entry point for the event loop
local function main()
  --Specifiying path for storing ocr handle
  local relativePath = "ocrhandle.ocm"
  -- Loading the training image
  local trainingImage = Image.load("resources/sicklogo.bmp")
  -- Loading label file
  local labelFileHandle = File.open("resources/LabelFile.txt", "r")
  local trainingLabelsString = File.read(labelFileHandle)
  -- Removing line breaks in labels
  local trainingLabelsTable = {}
  trainingLabelsString:gsub(".",
  function(c)
      if(c:match("%w")) then
      table.insert(trainingLabelsTable,c)
    end
  end)
  -- Training OCR handle by calling trainOCR
  trainOCR(trainingImage, trainingLabelsTable, relativePath)
  print("App finished.")
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register("Engine.OnStarted", main)

--End of Function and Event Scope-----------------------------------------------
