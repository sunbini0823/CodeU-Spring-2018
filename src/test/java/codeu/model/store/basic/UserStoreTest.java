package codeu.model.store.basic;

import codeu.model.data.Message;
import codeu.model.data.User;
import codeu.model.store.persistence.PersistentStorageAgent;
import codeu.model.store.persistence.PersistentDataStoreException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;

public class UserStoreTest {

  private UserStore userStore;
  private PersistentStorageAgent mockPersistentStorageAgent;
  private String photo_url = "https://i1.wp.com/www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png?resize=256%2C256&quality=100";
  private final User USER_ONE =
      new User(UUID.randomUUID(), "test_username_one", "password one", Instant.ofEpochMilli(1000), photo_url, "", "test_about_one", "test_email_one");
  private final User USER_TWO =
      new User(UUID.randomUUID(), "test_username_two", "password two", Instant.ofEpochMilli(2000), photo_url, "", "test_about_two", "test_email_two");
  private final User USER_THREE =     
	 new User(UUID.randomUUID(), "test_username_three", "password three", Instant.ofEpochMilli(3000), photo_url, "", "test_about_three", "test_email_three");

  @Before
  public void setup() {
    mockPersistentStorageAgent = Mockito.mock(PersistentStorageAgent.class);
    userStore = UserStore.getTestInstance(mockPersistentStorageAgent);

    final List<User> userList = new ArrayList<>();
    userList.add(USER_ONE);
    userList.add(USER_TWO);
    userList.add(USER_THREE);
    userStore.setUsers(userList);
  }

  @Test
  public void testGetUser_byUsername_found() {
    User resultUser = userStore.getUser(USER_ONE.getName());

    assertEquals(USER_ONE, resultUser);
  }

  @Test
  public void testGetUser_byId_found() {
    User resultUser = userStore.getUser(USER_ONE.getId());

    assertEquals(USER_ONE, resultUser);
  }

  @Test
  public void testGetUser_byUsername_notFound() {
    User resultUser = userStore.getUser("fake username");

    Assert.assertNull(resultUser);
  }

  @Test
  public void testGetUser_byId_notFound() {
    User resultUser = userStore.getUser(UUID.randomUUID());

    Assert.assertNull(resultUser);
  }
  
  @Test
  public void testGetRecentUsers() {

	User inputUser = new User(UUID.randomUUID(), "test_username", "password", Instant.now(), photo_url, "", "test_about", "test_email");
	User oldUser = new User(UUID.randomUUID(), "old_user", "pwd", Instant.parse("1998-10-21T10:12:35Z"), photo_url, "", "test_about", "test_email");

	userStore.addUser(inputUser);
	userStore.addUser(oldUser);
	
    List<User> resultUsers = userStore.getRecentUsers();

    assertEquals(inputUser, resultUsers.get(0));
    Assert.assertEquals(1, resultUsers.size());
  }

  @Test
  public void testAddUser() {
    User inputUser = new User(UUID.randomUUID(), "test_username", "test_password", Instant.now(), photo_url, "", "test_about", "test_email");

    userStore.addUser(inputUser);
    User resultUser = userStore.getUser("test_username");

    assertEquals(inputUser, resultUser);
    Mockito.verify(mockPersistentStorageAgent).writeThrough(inputUser);
  }

  public void testUpdateUserPhoto() throws PersistentDataStoreException {
    User inputUser = new User(UUID.randomUUID(), "test_username", "test_password", Instant.now(), photo_url, "", "test_about","test_email");
    String photo_url = "http://via.placeholder.com/350x150";
    String user_skills = "c++, java, js";
    String about = "About me.";
    userStore.updateUserPhoto(inputUser, photo_url, user_skills, about);
    User resultUser = userStore.getUser("test_username");

    assertEquals(inputUser, resultUser);
    Mockito.verify(mockPersistentStorageAgent).writeThrough(inputUser);
  }
  
  @Test
  public void testIsUserRegistered_true() {
    Assert.assertTrue(userStore.isUserRegistered(USER_ONE.getName()));
  }

  @Test
  public void testIsUserRegistered_false() {
    Assert.assertFalse(userStore.isUserRegistered("fake username"));
  }

  private void assertEquals(User expectedUser, User actualUser) {
    Assert.assertEquals(expectedUser.getId(), actualUser.getId());
    Assert.assertEquals(expectedUser.getName(), actualUser.getName());
    Assert.assertEquals(expectedUser.getPassword(), actualUser.getPassword());
    Assert.assertEquals(expectedUser.getCreationTime(), actualUser.getCreationTime());
    Assert.assertEquals(expectedUser.getPhotoURL(), actualUser.getPhotoURL());
    Assert.assertEquals(expectedUser.getSkills(), actualUser.getSkills());
    Assert.assertEquals(expectedUser.getAbout(), actualUser.getAbout());
  }
}
