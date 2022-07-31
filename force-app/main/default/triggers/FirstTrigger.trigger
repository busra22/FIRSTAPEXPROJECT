trigger FirstTrigger on Account (before insert) {
    system.debug('I am inside Trigger, YAY!!!');
}