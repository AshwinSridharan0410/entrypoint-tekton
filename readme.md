1) Build the dockerfile with the command<br>
   	**docker build -t entrypoint .**
2) Once it is built, run the built image<br>
   	**docker run -it entrypoint bash**
3) Clone this repository https://github.com/tektoncd/pipeline.git and change directory to cmd/entrypoint<br>
   	**git clone https://github.com/tektoncd/pipeline.git<br>
   	cd cmd/entrypoint**<br>
4) Then build the entrypoint utility from here with go<br>
   	**go build -o entrypoint**<br>
   And that's it, you can use the entrypoint utility of tekton with ./entrypoint.<br>
5) To use the binary globally, move it to a directory in your system's PATH, such as /usr/local/bin:<br>
   	**sudo mv entrypoint /usr/local/bin/**
