import 'package:flutter/material.dart';
import 'package:moviesflutter/screens/db_helper.dart';

class addMovies extends StatefulWidget{
  @override
  State<addMovies> createState() => _addMovies();
}

class _addMovies extends State<addMovies>{
  List<Map<String, dynamic>> _allData = [];
  bool _isLoading = true;

  void _refreshData() async{
    final data = await SQLHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });  }

    @override
    void initState() { 
      super.initState();
      _refreshData();
      
    }


    Future<void> _addData() async{
      await SQLHelper.createData(_titleController.text, _yearController.text, _directorController.text, _categoryController.text, _synopsisController.text, _imageController.text);
      _refreshData();
    }

    void _updateData(int id) async {
      await SQLHelper.updateData(id, _titleController.text, _yearController.text, _directorController.text, _categoryController.text, _synopsisController.text, _imageController.text);
      _refreshData();
    }

    void _deleteData(int id) async{
      await SQLHelper.deleteData(id);
      ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text('Data deleted')
        ));
        _refreshData();
    }

    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _yearController = TextEditingController();
    final TextEditingController _directorController = TextEditingController();
    final TextEditingController _categoryController = TextEditingController();
    final TextEditingController _synopsisController = TextEditingController();
    final TextEditingController _imageController = TextEditingController();


    void showBottomSheet(int? id) async{
      if(id!=null){
        final existingData =
        _allData.firstWhere((element) => element['id'] == id);
        _titleController.text = existingData['title'];
        _yearController.text = existingData['year'];
        _directorController.text = existingData['director'];
        _categoryController.text = existingData['category'];
        _synopsisController.text = existingData['synopsis'];
        _imageController.text = existingData['image'];
      }

      showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (_) => Container(
          padding: EdgeInsets.only(
            top: 30,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 50,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Titulo", 
                ),
              ),
              SizedBox(height: 10),
               TextField(
                controller: _yearController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Año", 
                ),
               ),
               SizedBox(height: 10),
               TextField(
                controller: _directorController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Director", 
                ),
               ),
               SizedBox(height: 10),
               TextField(
                controller: _categoryController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Género", 
                ),
               ),
               SizedBox(height: 10),
               TextField(
                controller: _synopsisController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Sinopsis", 
                ),
               ),
               SizedBox(height: 10),
               TextField(
                controller: _imageController,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Url imagen", 
                ),
               ),
               SizedBox(height: 20),
               Center(
                child: ElevatedButton(
                  onPressed: () async{
                    if (id == null ){
                      await _addData();
                    }
                    if (id != null){
                      _updateData(id);
                    }

                    _titleController.text= "";
                    _yearController.text= "";
                    _directorController.text= "";
                    _categoryController.text="";
                    _synopsisController.text= "";
                    _imageController.text="";

                    Navigator.of(context).pop();
                    print("Agregado");
                  },
                  child: Padding(
                    padding: EdgeInsets.all(18),
                    child: Text(
                      id == null ? "Agregar" : "Actualizar",
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: 
                        FontWeight.w500),
                    ), 
                    ),
                ),
               )
            ],
            ),
        )
        );
    }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD películas"),   
      ),
      body: _isLoading
      ? Center(
        child: CircularProgressIndicator(),
      )
      : ListView.builder(
        itemCount: _allData.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.all(15),
          child: ListTile(
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                _allData[index]['title'],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              ),
              subtitle: Text(_allData[index]['year']['director']['category']['synopsis']['image']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: (){
                      showBottomSheet(_allData[index]['id']);
                    },
                   icon: Icon(
                    Icons.edit,
                    color: Colors.indigo,
                   ),
                   ),
                   IconButton(
                    onPressed: () {
                      _deleteData(_allData[index]['id']);
                    }, 
                    icon: Icon(
                      Icons.delete,
                      color: Colors.redAccent
                      ),
                      ),
                ],
              ),

          ),
        )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showBottomSheet(null),
          child: Icon(Icons.add),
           ),
    );
  }
}