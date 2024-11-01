/* SliverAppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              floating: false,
              pinned: true,
              snap: false,
              expandedHeight: 150.0,
              backgroundColor: brownColorOfAppBar,

              flexibleSpace: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                child: FlexibleSpaceBar(
                  title: Container(
                    width: 135,
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    margin: const EdgeInsets.only(top: 40, left: 10),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 10,
                          color: Colors.white70,
                        ),
                        Text(
                          locationOfUser,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 10,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(
                        color: Colors.white,
                        Icons.notifications,
                        size: 25.0, // Change the icon size
                      ),
                      onPressed: () {
                        // Handle notification icon tap
                      },
                    ),
                    Positioned(
                      right: 11,
                      top: 11,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: const Text(
                          '1', // Badge text
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ), */

/* Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),*/

/*_loading
                                      ? const Center(
                                          child: CircularProgressIndicator())

                                      : Expanded(
                                        child: SizedBox(
                                            height: 100,
                                            child: ListView.builder(
                                              itemCount: _reviews.length,
                                              itemBuilder: (context, index) {
                                                final review = _reviews[index];
                                                return ListTile(
                                                  title:
                                                      Text(review['author_name']),
                                                  subtitle: Text(review['text']),
                                                  trailing: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Icon(Icons.star,
                                                          color: Colors.yellow),
                                                      Text(review['rating']
                                                          .toString()),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                      ),*/

//"${widget.service} Salons"