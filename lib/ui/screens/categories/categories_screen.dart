

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SparkColors.color2,
        elevation: 0,
        leading:  IconButton(icon: const Icon(Icons.arrow_back), color: Colors.black, onPressed: () { Navigator.pop(context); }, ),
        title:
            Text('Our Services', style: SparkTheme.lightTextTheme.headlineLarge),
        /*actions: const [
          Icon(Icons.more_vert, color: Colors.black),
        ],*/
      ),
      body: ListView(
        primary: true,
        shrinkWrap: true,
        children: [
          SparkSizedBox(
            height: 3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 51.w),
            child: SizedBox(
                height: 254.h,
                width: 254.w,
                child: Image.asset('assets/categories_picture.png')),
          ),
          SparkSizedBox(
            height: 5,
          ),
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
                crossAxisSpacing: 24.w,
                mainAxisSpacing: 18.h,
                mainAxisExtent: 135.h),
            itemCount: 8,
            itemBuilder: (context, index) {
              return ServiceCard(
              index: index,
              );
            },
          ),
          SparkSizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final int index;

  const ServiceCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

    return Card(
      color: SparkColors.color2,
      shadowColor: SparkColors.color7,
      elevation: 11.r,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 15.h),
            child: Container(
              width: 46.w,
              height: 46.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(96.r))),
              child: Image.asset(categories[index].imagePath),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(categories[index].title, style: SparkTheme.lightTextTheme.headlineSmall,textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
