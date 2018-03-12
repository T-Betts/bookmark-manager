# Bookmark Manager

## User Stories:

```
As a user
So that I can quickly go to web sites I regularly visit
I would like to see a list of links on the homepage

+----------------------+       .all            +------------------------+
|                      |  +------------------> |                        |
|      controller      |                       |         links          |
|                      |    [array of links]   |                        |
|                      |  <------------------+ |                        |
+----------------------+                       +------------------------+


As a content contributor
So that I can expand the content of the webpage
I would like to add new links

As a content contributor
So that I can keep the content clean and relevant
I would like to be able to delete links

As a content contributor
So that I can keep the content clean and relevant
I would like to be able to update links

+-----------------+            +------------------+
|                 |    .add    |                  |
|    new link     | +--------> |      links       |
|                 |            |                  |
+-----------------+            +-+-------+--------+
                                 ^       ^
                                 |       |
                          .delete|       |.update
                                 |       |
                       +---------+-------+-+
                       |     existing      |
                       |       link        |
                       +-------------------+


As a user and content contributor
So that I can convey my opinion on a link
I would like to comment on links

+-----------------+            +-------------------+
|                 |            |                   |
|    controller   |.add_comment|    existing       |
|                 | +--------> |      link         |
|                 |            |                   |
+-----------------+            +-------------------+


As a content contributor
So other users can find the content I have added more easily
I would like to tag links into categories

As a user
So I can filter and find content that I am interested in
I would like to filter links by tag

As a content contributor
So that I can keep the content I have added under control
I would like to manage my links
```
