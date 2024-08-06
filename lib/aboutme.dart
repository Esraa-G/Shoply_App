import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);

          },
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.indigo,
        elevation: 16,
        title: const Text('About Me',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/me.jpg'),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Esraa Gamal Elsayed Salah',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  'UI/UX Designer',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
              ),
              const SizedBox(height: 20),
              const Text(
                'About Me',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "My name is Esraa Gamal Elsayed Salah, "
                    "and I am 21 years old. "
                    "I am currently studying at the Faculty of Computers and Information at Mansoura University,"
                    " in my fourth year, majoring in Computer Science. "
                    "My primary track is UI/UX design, "
                    "where I bring creativity and innovation to user experiences.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
              ),
              const SizedBox(height: 20),
              const Text(
                'Education',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "B.Sc. in Computer Science\nFaculty of Computers and Information, Mansoura University\nClass of 2025",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
              ),
              const SizedBox(height: 20),
              const Text(
                'Skills',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "• UI/UX Design\n• Flutter Development\n• Graphic Design\n• Wireframing & Prototyping",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
              ),
              const SizedBox(height: 20),
              const Text(
                'Contact',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Email: esrgamal@std.mans.edu.eg\n"
                    "LinkedIn: https://www.linkedin.com/in/esraa-gamal-89022a268?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app"
                    "\nGitHub: github.com/EsraaG",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
