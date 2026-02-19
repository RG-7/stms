// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:provider/provider.dart';

import '/src/data/provider/schedule.dart';

import '/export.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.white,
      body: SelectSubGroup(),
    );
  }
}

class SelectSubGroup extends StatefulWidget {
  final bool navigate;
  const SelectSubGroup({super.key, this.navigate = false});

  @override
  State<SelectSubGroup> createState() => _SelectSubGroupState();
}

class _SelectSubGroupState extends State<SelectSubGroup> {
  final TextEditingController _searchController = TextEditingController();
  bool _isDropdownVisible = false; // Controls visibility of the dropdown

  // List of subgroups
  List<String> filteredSubGroups = []; // Filtered list

  @override
  void initState() {
    super.initState();

    // Get provider instance connected to the widget tree
    final sched = Provider.of<ScheduleProvider>(context, listen: false);

    // Initialize filtered list
    filteredSubGroups = List.from(sched.groups);

    // Pre-fill selected subgroup (if already selected)
    if (sched.selectedSubGroup != null) {
      _searchController.text = sched.selectedSubGroup!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final sched = Provider.of<ScheduleProvider>(context, listen: false);

    return Container(
      color: AppColor.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select Your SubGroup!',
                      style: h1StyleBlue.copyWith(
                          fontSize: width <= 360 ? 25 : 30),
                    ),
                    const SizedBox(height: 20),

                    // Searchable TextField
                    TextField(
                      controller: _searchController,
                      readOnly: true, // Disable manual typing
                      decoration: const InputDecoration(
                        labelText: 'Search SubGroup',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                      onTap: () {
                        // Show dropdown when tapped
                        setState(() {
                          _isDropdownVisible = true;
                        });
                      },
                    ),
                    const SizedBox(height: 10),

                    // Dropdown Container
                    if (_isDropdownVisible)
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: filteredSubGroups.isNotEmpty
                              ? (filteredSubGroups.length > 5
                                  ? 250
                                  : 50.0 *
                                      filteredSubGroups
                                          .length) // Dynamic height
                              : 0, // No data hides dropdown
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                          color: Colors.white,
                        ),
                        child: filteredSubGroups.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: filteredSubGroups.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(filteredSubGroups[index]),
                                    onTap: () {
                                      // Update subgroup selection
                                      sched.updateSelectedSubGroup(
                                          filteredSubGroups[index]);

                                      // Update the text field
                                      _searchController.text =
                                          filteredSubGroups[index];

                                      // Hide dropdown
                                      setState(() {
                                        _isDropdownVisible = false;
                                      });

                                      sched.fetchSubGroupSchedule(context);

                                      // Navigate to Dashboard with the selected subgroup
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DashBoard(),
                                        ),
                                      );
                                    },
                                  );
                                },
                              )
                            : const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'No results found',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                      ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                ),
                child: Text(
                  'Login Instead',
                  style: bodyStyle2.copyWith(fontSize: width <= 360 ? 16 : 20),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
